module CamaleonCms
  class ApplicationRecord < ActiveRecord::Base
      default_scope -> { order(:created_at) }
      self.abstract_class = true
        #Define UUID
        before_create :set_uuid
        def set_uuid
          self.id = SecureRandom.uuid
        end
    end
  end