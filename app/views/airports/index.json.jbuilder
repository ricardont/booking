json.array! @airports do |airport| 
    json.iata airport.iata
    json.label airport.city + ', ' + airport.name + ', ' + airport.country 
    json.value airport.city + ', ' + airport.name + ', ' + airport.country
end

