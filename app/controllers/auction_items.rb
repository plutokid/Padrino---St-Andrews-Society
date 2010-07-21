PadrinoSas.controllers :auction_items do

  before do
    protected!
  end

  get :index, :map => "members/online_auction" do
    @title = "Heritage Night Online Auction"
    @title_image = "titletop8.png"
    @items = AuctionItem.all(:order => "created_at ASC")
    render 'auction_items/index'
  end

end