class Airport < ApplicationRecord
	scope :search,  -> (key)  { where(" city LIKE ? or name LIKE ? or iata LIKE ? ", "#{key.to_s}%", "#{key.to_s}%", "#{key.to_s}%"  ) }
end
