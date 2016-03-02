require "urlable/version"
require 'active_support/concern'
require 'active_record'

module Urlable
  class ActiveRecord::Base
    def self.acts_as_urlable
      include Urlable
    end
  end
  module Urlable
    extend ActiveSupport::Concern

    included do
      has_many :urls, dependent: :destroy, as: :urlable

      def link_url dst
        if self.urls.empty? || !self.urls.where(dst: dst).first
          if Url.find_by_dst(dst) && !self.urls.where(dst: dst).first
            dst += '-0'
            while Url.find_by_dst(dst) && !self.urls.where(dst: dst).first do
              dst.succ!
            end
          end
          self.urls.find_or_initialize_by(dst: dst)
        end
        self.url = dst
      end
    end
  end

end
