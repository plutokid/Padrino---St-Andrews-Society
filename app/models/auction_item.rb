class AuctionItem < ActiveRecord::Base
  has_many :bids, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :description1
  validates_presence_of :image_name
  
  def highest_bid
    self.bids.last.amount
  end  
  
  def highest_bidder
    self.bids.last.bidder 
  end
  
end
