class Airport < ApplicationRecord
	scope :search,  -> (key)  { where(" city ILIKE ? or name ILIKE ? or iata ILIKE ? ", "%#{key.to_s}%", "%#{key.to_s}%", "%#{key.to_s}%"  ) }
end
