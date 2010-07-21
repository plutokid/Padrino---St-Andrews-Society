PadrinoSas.controllers :members do

  before do
    protected!
  end

  get :dashboard, :map => "/members/dashboard" do
    @title = "Dashboard"
    @title_image = "titletop1.png"
    render "members/dashboard"
  end
  
  get :upcoming_events, :map => "/members/upcoming_events" do
    @title = "Upcoming Events"
    @title_image = "titletop2.png"
    render "members/upcoming_events"
  end

  get :membership_resources, :map => "/members/membership_resources" do
    @title = "Membership Resources"
    @title_image = "titletop3.png"
    render "members/membership_resources"
  end

  get :officer_roster, :map => "/members/officer_roster" do
    @title = "Officer Roster"
    @title_image = "titletop5.png"
    render "members/officer_roster"
  end
  
  get :highland_attire, :map => "/members/highland_attire" do
    @title = "Highland Attire"
    @title_image = "titletop4.png"
    render "members/highland_attire"
  end

  get :photo_gallery, :map => "/members/photo_gallery" do
    @title = "Photo Gallery"
    @title_image = "titletop6.png"
    render "members/photo_gallery"
  end
  
  get :helpful_links, :map => "/members/helpful_links" do
    @title = "Helpful Links"
    @title_image = "titletop7.png"
    render "members/helpful_links"
  end
   
end