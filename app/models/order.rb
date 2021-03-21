class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy

    enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
    enum pay_way: { クレジットカード: 0, 銀行振込: 1 }

    validates :postal_code, presence: true, format: {with: /\A\d{7}\z/ }
    validates :address, presence: true
    validates :name, presence: true, length: { minimum: 2 }
end
