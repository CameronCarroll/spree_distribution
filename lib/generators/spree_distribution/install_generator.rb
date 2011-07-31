require 'generators/base'

module SpreeDistribution
  module Generators
    class InstallGenerator < SpreeDistribution::Generators::Base
      
      desc "Installs required migrations for spree_distribution"
      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_migrations
        migration_template "db/migrate/install_spree_distribution.rb", "db/migrate/install_spree_distribution.rb"
      end

    end
  end
end
