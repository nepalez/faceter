require "faceter"

# Example of the input item
# {
#   "provider_id" => "010001",
#   "hospital_name" => "SOUTHEAST ALABAMA MEDICAL CENTER",
#   "address" => "1108 ROSS CLARK CIRCLE",
#   "city" => "DOTHAN",
#   "state" => "AL",
#   "zip_code" => "36301",
#   "county_name" => "HOUSTON",
#   "phone_number" => "3347938701",
#   "hospital_type" => "Acute Care Hospitals",
#   "hospital_ownership" => "Government - Hospital District or Authority",
#   "emergency_services" => "true",
#   "location" => "1108 ROSS CLARK CIRCLE, 36301\n(31.21537938, -85.36146588)"
# }
#
# Expected output
# {
#   state: "AL",
#   cities: [
#     {
#       country: "HOUSTON",
#       city:    "DOTHAN",
#       hospitals: [
#         {
#           id:    "010001",
#           name:  "SOUTHEAST ALABAMA MEDICAL CENTER",
#           phone: "3347938701",
#           description: {
#             type:      "Acute Care Hospitals",
#             ownership: "Government - Hospital District or Authority",
#             emergency: true
#           },
#           location: {
#             zip_code: "36301",
#             address:  "1108 ROSS CLARK CIRCLE, 36301",
#             point:    [31.21537938, -85.36146588]
#           }
#         }
#       ]
#     }
#   ]
# }

class FaceterHospitals < Faceter::Mapper
  list do
    symbolize_keys

    rename :location,           to: :point
    rename :emergency_services, to: :emergency
    rename :provider_id,        to: :id
    rename :phone_number,       to: :phone
    rename :county_name,        to: :country
    remove_prefix "hospital"

    create :point, from: :point do |source|
      coords = source.match(/\((.+), (.+)\)$/).to_a[1..-1]
      coords ? coords.map(&:to_f) : []
    end

    create :emergency, from: :emergency do |source|
      (source == "true") ? true : false
    end

    wrap :zip_code, :address, :point,   to: :location
    wrap :type, :ownership, :emergency, to: :description
  end

  group :id, :name, :phone, :description, :location, to: :hospitals
  group :hospitals, :city, :country, to: :cities
end
