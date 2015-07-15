require "rom"

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

class RomHospitals < ROM::Mapper
  relation    :hospitals
  register_as :rom

  symbolize_keys true
  attribute :state

  group :cities do
    attribute :country, from: :county_name
    attribute :city

    group :hospitals do
      attribute :id,    from: :provider_id
      attribute :name,  from: :hospital_name
      attribute :phone, from: :phone_number

      wrap :description, prefix: "hospital" do
        attribute :type
        attribute :ownership
        attribute :emergency, from: :emergency_services do |source|
          (source == "true") ? true : false
        end
      end

      wrap :location do
        attribute :address
        attribute :zip_code
        attribute :point, from: :location do |source|
          coords = source.match(/\((.+), (.+)\)$/).to_a[1..-1]
          coords ? coords.map(&:to_f) : []
        end
      end
    end
  end
end
