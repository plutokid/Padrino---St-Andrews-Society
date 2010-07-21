Admin.controllers :auction_items do

  get :index do
    @auction_items = AuctionItem.all
    total = 0.0
    @auction_items.each do |item| 
      total += item.bids.last.amount.gsub("$","").to_f
    end
    @total_of_bids = "$" + sprintf("%.2f", total.to_s)
    
    render 'auction_items/index'
  end

  get :new do
    @auction_item = AuctionItem.new
    render 'auction_items/new'
  end

  post :create do
    @auction_item = AuctionItem.new(params[:auction_item])
    if @auction_item.save
      @bid = Bid.new
      @bid.amount = "$0.00"
      @bid.bidder = "     "
      @bid.auction_item_id = @auction_item.id
        if @bid.save    
          flash[:notice] = 'AuctionItem was successfully created.'
          redirect url(:auction_items, :edit, :id => @auction_item.id)
        else
          @auction_item.destroy
          render 'auction_items/new'
        end 
    else
      render 'auction_items/new'
    end
  end

  get :edit, :with => :id do
    @auction_item = AuctionItem.find(params[:id])
    render 'auction_items/edit'
  end

  put :update, :with => :id do
    @auction_item = AuctionItem.find(params[:id])
    if @auction_item.update_attributes(params[:auction_item])
      flash[:notice] = 'AuctionItem was successfully updated.'
      redirect url(:auction_items, :edit, :id => @auction_item.id)
    else
      render 'auction_items/edit'
    end
  end

  delete :destroy, :with => :id do
    auction_item = AuctionItem.find(params[:id])
    if auction_item.destroy
      flash[:notice] = 'AuctionItem was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy AuctionItem!'
    end
    redirect url(:auction_items, :index)
  end
end