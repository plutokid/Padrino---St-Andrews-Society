class Bid < ActiveRecord::Base
  belongs_to :auction_item

  validates_format_of :amount, :with => /^\$\d+.\d{2}$/, :message => "Value must be in the format $xx.xx."
  validates_format_of :bidder, :with => /^[a-zA-Z \-\']+$/, :messgae => "This does not appear to be a proper name."

end
