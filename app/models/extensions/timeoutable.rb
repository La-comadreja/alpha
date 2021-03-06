module Extensions
  module Timeoutable
    extend ActiveSupport::Concern

    included do

      # Options
      #  timeout_in:
      #    The interval to timeout the user session without activity.
      #
      devise :timeoutable

    end

  end
end 
