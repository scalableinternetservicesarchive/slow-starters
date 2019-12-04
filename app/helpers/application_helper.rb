module ApplicationHelper
  def listingStatus(listing, user)
    if not user_signed_in?
      return "Log in to Reserve", ""
    elsif listing.user_id == user.id
      return "Owner", "green"
    else
      reservation = listing.reservations.find{|reservation| reservation.user_id == current_user.id}
      if reservation == nil
        return "Reserve Now!", ""
      else
        if reservation.seller_confirmed && reservation.buyer_confirmed
          return "Completed", "#DAA520"
        else
          return "Reserved", "green"
        end
      end
    end
  end
end
