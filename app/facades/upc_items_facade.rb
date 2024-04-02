class UpcItemsFacade
  def get_item_by_upc(upc)
    details = service.get_item_info(upc)
    if details[:success] == false
      {
        "message": "Not Found. No product could be found with that code."
      }
    else
      UpcItem.new(details, upc)
    end
  end

  def service
    UpcItemsService.new
  end
end