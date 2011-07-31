require 'generators/base'

module SpreeDistribution
  module Generators
    class UpgradeGenerator < SpreeDistribution::Generators::Base
      
      desc "Upgrades an existing spree_distribution installation"
      source_root File.expand_path("../../templates", __FILE__)
      
      def copy_migrations
        migration_template "db/migrate/upgrade_spree_distribution.rb", "db/migrate/upgrade_spree_distribution.rb"
      end

    end
  end
end
