class AllergensFacade
  def get_allergen_by_upc(upc)
    details = service.get_allergen_info(upc)
    Allergen.new(details, upc)
  end

  def service
    AllergensService.new
  end
end