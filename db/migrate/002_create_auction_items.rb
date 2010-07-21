class CreateAuctionItems < ActiveRecord::Migration
  def self.up
    create_table :auction_items do |t|
      t.string :title
      t.text :description1
      t.text :description2
      t.string :image_name      
      t.timestamps
    end
  end

  def self.down
    drop_table :auction_items
  end
end
