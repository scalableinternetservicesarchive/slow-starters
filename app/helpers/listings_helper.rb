module ListingsHelper
    def cache_key_for_listing_card(listing)
        "listing-#{listing.id}-#{listing.updated_at}"
    end

    def cache_key_for_listing
        "listings-page-#{Listing.maximum(:updated_at)}-#{Message.maximum(:updated_at)}-#{Reservation.maximum(:updated_at)}"
    end
end
