

require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)["drinks"]
  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient["strIngredient1"][0])
  end

