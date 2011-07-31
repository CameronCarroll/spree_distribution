module SpreeDistribution
  module DistributorController


    def self.included(mod)
      mod.instance_eval do
        resource_controller
        prepend_before_filter :use_billing?, :only => [:create, :update]
        before_filter :setup_defaults, :only => [:new,:create,:edit,:update]
        
        index.before :new_distribution_user
        
        helper_method :distribution_role
        
      end
      mod.send(:include, ClassMethods)
    end
    
    module ClassMethods
      
      #=================================================
      # Overwrite point
      
      def after_distributor_create
        flash[:notice] = I18n.t('distributor.signup_success')
        redirect_to distributors_path
      end
      
      def after_distributor_failed_create
        flash[:error] = I18n.t('distributor.signup_failed')
        render :action => :new
      end
  
      #=================================================
      
      def distribution_role
        @distribution_role ||= Role.find_or_create_by_name("distributor")
      end
      
      def new_distribution_user
        @user = User.new
      end
      
      def attach_distributor_parts
        @distributor.user         = @user
        @distributor.bill_address = @bill_address
        @distributor.ship_address = @ship_address
      end
      
      def new
        @distributor ||= Distributor.new(params[:distributor])
      end
      
      def create
        if attach_distributor_parts && @distributor.save
          after_distributor_create
        else
          after_distributor_failed_create
        end
      end
      
      def update
        @bill_address.update_attributes(params[:bill_address])
        if use_billing?
          @distributor.ship_address.destroy unless @distributor.ship_address.nil? || @bill_address != @distributor.ship_address
          @ship_address = @bill_address
        else
          @ship_address = @distributor.build_ship_address if @ship_address.nil? || @bill_address == @distributor.ship_address
          @ship_address.update_attributes(params[:ship_address])
        end
        attach_distributor_parts
        @distributor.touch && @distributor.save
        super
      end
            
      def use_billing?
        @use_billing ||= params[:distributor].delete(:use_billing).to_i == 1
      end
      
      def setup_defaults
        params[:distributor] ||= {}
        if request.get? && params[:dev]
          params[:distributor] = {"company"=>"Test Company", "buyer_contact"=>"Mr Contacter", "manager_contact"=>"Mr Manager", "phone"=>"555-555-5555", "fax"=>"555-555-5555 ext 1", "resale_number"=>"13414214", "taxid"=>"555-55-5555", "web_address"=>"testcompany.com", "terms"=>"Credit Card", "notes"=>""}
          params[:user] = {"email"=>"distribution-#{rand(100)}@example.com", :password => "password" , :password_confirmation => "password" }
          params[:bill_address] = {"firstname"=>"Mister","lastname"=>"Accountant","address1"=>"123 Anystreet", "address2"=>"", "city"=>"Anytown", "state_id"=>"276110813", "zipcode"=>"98765", "country_id"=>"214", "phone"=>"555-555-5555"}
        end
        @roles = Role.all
        case params[:action]
          when 'new', 'create'
            @distributor = Distributor.new(params[:distributor])    
            @user = User.new(params[:user])
            @bill_address = Address.new(params[:bill_address] || { :country_id => default_country.id })
            if use_billing?
              @ship_address = @bill_address
            else
              @ship_address = Address.new(params[:ship_address] || { :country_id => default_country.id })
            end                    
          when 'edit', 'update', 'destroy'
            @distributor   = Distributor.find(params[:id])
            @user         = @distributor.user
            @bill_address = @distributor.bill_address
            @ship_address = @distributor.ship_address                        
        end                
      end    
    end
  end
end
