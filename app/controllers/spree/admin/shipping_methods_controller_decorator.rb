module Spree
  module Admin
    module ShippingMethodsControllerDecorator
      private

      alias_method :old_set_shipping_category, :set_shipping_category
      alias_method :old_set_zones, :set_zones

      # We have to override those filters since they break proper PATCH behaviour.

      def set_shipping_category
        old_set_shipping_category unless params['shipping_method'][:translations_attributes]
      end

      def set_zones
        old_set_zones unless params['shipping_method'][:translations_attributes]
      end
    end
  end
end

(Spree::Admin::ShippingMethodsController.prepend Spree::Admin::ShippingMethodsControllerDecorator) if Spree.version.to_f >= 3.7
