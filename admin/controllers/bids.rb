Admin.controllers :bids do

  get :index do
    @bids = Bid.all
    @auction_items = AuctionItem.all
    render 'bids/index'
  end

  get :new do   
    @bid = Bid.new
    render 'bids/new'
  end

  post :create do
    @bid = Bid.new(params[:bid])
    if @bid.save
      flash[:notice] = 'Bid was successfully created.'
      redirect url(:bids, :edit, :id => @bid.id)
    else
      render 'bids/new'
    end
  end

  get :edit, :with => :id do
    @bid = Bid.find(params[:id])
    render 'bids/edit'
  end

  put :update, :with => :id do   
    @bid = Bid.find(params[:id])
    if @bid.update_attributes(params[:bid])
      flash[:notice] = 'Bid was successfully updated.'
      redirect url(:bids, :edit, :id => @bid.id)
    else
      render 'bids/edit'
    end
  end

  delete :destroy, :with => :id do
    bid = Bid.find(params[:id])
    if bid.destroy
      flash[:notice] = 'Bid was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Bid!'
    end
    redirect url(:bids, :index)
  end
end