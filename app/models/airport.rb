class Airport < ApplicationRecord
	scope :search,  -> (key)  { where(" city ilike ? or name ilike ? or iata ilike ? ", "%#{key.to_s}%", "%#{key.to_s}%", "%#{key.to_s}%"  ) }
end
