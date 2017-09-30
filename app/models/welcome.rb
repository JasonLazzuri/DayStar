class Welcome < ApplicationRecord

  validates_email_format_of :email, :message => "this doesn't look like an email"

  validates :name, :email, :phone, :message, presence: true

end
