class AllergensFacade
  def get_allergen_by_upc(upc)
    details = service.get_allergen_info(upc)
    if details[:success] == false
      {
        "message": "Not Found. No product could be found with that code."
      }
    else
      Allergen.new(details, upc)
    end
  end

  def service
    AllergensService.new
  end
end