class DraftOrderLine < ApplicationRecord
    belongs_to :draft_order
    has_many :products
end
