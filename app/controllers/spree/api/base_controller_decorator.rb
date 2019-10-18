module Spree
  module Api
    module BaseControllerDecorator
      include SpreeGlobalize::ControllerGlobalizeHelper
    end
  end
end

(Spree::Api::BaseController.prepend Spree::Api::BaseControllerDecorator) if Spree.version.to_f >= 3.7
