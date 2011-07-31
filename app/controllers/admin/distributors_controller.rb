class Admin::DistributorsController < Admin::ResourceController
  
  include SpreeDistribution::DistributorController
  
  before_filter :approval_setup, :only => [ :approve, :reject ]
  
  def after_distributor_create
    flash[:notice] = t('admin.distributors.success')
    redirect_to admin_distributors_path
  end
  
  def after_distributor_failed_create
    flash[:error] = t('admin.distributors.failed')
    render :action => :new
  end
  
  def approve
    return redirect_to request.referer, :flash => { :error => "Distributor is already active." } if @distributor.active?
    @distributor.activate!
    redirect_to request.referer, :flash => { :notice => "Distributor was successfully approved." }
  end
  
  def reject
    return redirect_to request.referer, :flash => { :error => "Distributor is already rejected." } unless @distributor.active?
    @distributor.deactivate!
    redirect_to request.referer, :flash => { :notice => "Distributor was successfully rejected." }
  end
  
  def approval_setup
    @distributor = Distributor.find(params[:id])
    @role = Role.find_by_name("distributor")
  end
    
  private
  
    def collection
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "company.asc"
      @search = Distributor.search(params[:search])
      @collection = @search.paginate(:per_page => Spree::Config[:admin_products_per_page], :page => params[:page])
    end
 
end
