module ShowsHelper
  def watchlist_options(listings, show)
    if @listings.count > 0
      render :partial => "listings/details", :locals => {:listings => listings, :show => show}
    else
      "None"
    end
  end
end
