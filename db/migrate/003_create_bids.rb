class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.string :amount
      t.string :bidder
      t.integer :auction_item_id
      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
