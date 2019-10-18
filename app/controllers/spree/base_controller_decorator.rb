module Spree
  module BaseControllerDecorator
    include SpreeGlobalize::ControllerGlobalizeHelper
  end
end

(Spree::BaseController.prepend Spree::BaseControllerDecorator) if Spree.version.to_f >= 3.7
