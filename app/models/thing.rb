class Thing < ActiveRecord::Base
  belongs_to :user

  include RankedModel
  ranks :row_order, :with_same => :user_id
end
