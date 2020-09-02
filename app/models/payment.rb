class Payment < ApplicationRecord
  belongs_to :user
  enum status: [:created, :edited, :executed, :declined]
end
