module Spree
  module Admin
    module OptionValuesControllerDecorator
      def update
        option_value = Spree::OptionValue.find(params[:id])
        option_value.update update_option_value_attribute
        redirect_to spree.edit_admin_option_type_path(option_value.option_type)
      end

      private
      def update_option_value_attribute
        params.require(:option_value).permit(permitted_params)
      end

      def permitted_params
        Spree::PermittedAttributes.option_value_attributes
      end
    end
  end
end

(Spree::Admin::OptionValuesController.prepend Spree::Admin::OptionValuesControllerDecorator) if Spree.version.to_f >= 3.7
