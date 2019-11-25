module ListingsHelper
    def cache_key_for_listing_card(listing)
        "listing-#{listing.id}-#{listing.updated_at}"
    end
end
