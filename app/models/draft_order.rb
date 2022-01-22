class DraftOrder < ApplicationRecord
    validates :cart_token, presence: true
    validates :name, presence: true

    has_many :draft_order_lines
    has_many :promotions
end
