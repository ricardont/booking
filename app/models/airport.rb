class Airport < ApplicationRecord
	scope :search,  -> (key)  { where(" city like ? or name like ? or iata like ? ", "%#{key.to_s}%", "%#{key.to_s}%", "%#{key.to_s}%"  ) }
end
