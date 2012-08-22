module FacturesHelper

  def total_facture(facture)
    total = 0
    total = facture.items.inject(0){|total, i| total + i.price }
    number_to_currency(total)
  end

end

