module CardsHelper

  def card_owner(card)
    owner = card.card_owner.attributes.keys.include?('user_name') ? card.card_owner : card.card_owner.user
  end

  def first_name(card)
    "#{card_owner(card).first_name}'s #{card.card_type} card"
  end

  def card_owner_name(card)
    owner = card_owner(card)
    "#{owner.first_name} #{owner.last_name}"
  end

end
