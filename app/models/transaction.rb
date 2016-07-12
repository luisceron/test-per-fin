class Transaction < ActiveRecord::Base
  enum transaction_type: [:in, :out]

  belongs_to :user
  belongs_to :account
  belongs_to :category

  validates :account, presence: true
  validates :category, presence: true
  validates :transaction_type, presence: true
  validates :date, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def to_s
    # self.account.try(:name)    + " - " +
    # self.transaction_type.to_s + " - " +
    # self.category.try(:name)   + " - " +
    # self.try(:description)

    I18n.t(self.transaction_type.to_sym, scope: "activerecord.attributes.transaction.transaction_types") 
  end
end