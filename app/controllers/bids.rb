PadrinoSas.controllers :bids do

  before do
    protected!
  end

  post :create, :map => "members/online_auction/new_bid" do
    @bid = Bid.new(params[:bid])
    @last_bid = Bid.find(:last, :conditions => "auction_item_id = '#{@bid.auction_item_id}'" )
    if @last_bid.amount.gsub("$","").to_f >= @bid.amount.gsub("$","").to_f
      flash[:error] = "Your bid must be higher than the current bidder."
      redirect '/members/online_auction'
    else
      if @bid.save 
        flash[:notice] = "Your bid has been successfully posted."
        redirect '/members/online_auction'
      else
        flash[:error] = "Your bid must be of the correct format."
        redirect '/members/online_auction'
      end
    end
  end

end