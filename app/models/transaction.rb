class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.successful
    joins(:invoice).where(result: 'success')
  end
end
