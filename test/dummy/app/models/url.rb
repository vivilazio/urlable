class Url < ActiveRecord::Base
  belongs_to :urlable, :polymorphic => true, :touch => true
end
