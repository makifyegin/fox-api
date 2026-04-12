# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Seeding countries..."

ISO3166::Country.all.each do |iso_country|
  Country.find_or_create_by!(code: iso_country.alpha2) do |country|
    country.name = iso_country.common_name
  end
end

puts "Created #{Country.count} countries"


puts "Seeding regions..."

uk = Country.find_by!(code: "GB")

["London", "South East", "South West", "West Midlands", "East Midlands", "North West", "North East", "Yorkshire", "Scotland", "Wales", "Northern Ireland"].each do |region_name|
  Region.find_or_create_by!(name: region_name, country: uk)
end

puts "Created #{Region.count} regions"

