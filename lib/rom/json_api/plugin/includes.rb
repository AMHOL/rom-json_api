module ROM
  module JsonApi
    module Plugin
      # @api private
      module Includes
        # @api private
        def self.included(klass)
          super
          klass.class_eval do
            include(InstanceInterface)
          end
        end

        # @api private
        module InstanceInterface
          def includes(*includes)
            add_params(
              include: (dataset.params[:include].to_a + includes).flatten.join(',')
            )
          end
        end
      end
    end
  end
end
