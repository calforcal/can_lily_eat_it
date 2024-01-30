class AllergensService
  def get_allergen_info(upc)
    response = conn.get("/product/#{upc}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.upcdatabase.org") do |faraday|
      faraday.headers['Authorization'] = ENV['UPC_DATABASE_API_KEY']
    end
  end
end