require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
	describe 'search flights' do 
	    #it 'must respond with status 200 ok' do
		#	get :index
		#	expect(response.status).to eq(200)
		#end 	
		today = DateTime.now.strftime "%d/%m/%Y" 
    tomorrow = (DateTime.now + 1).strftime "%d/%m/%Y"
		before(:each) do
  	stub_request(:get, "#{ENV['flights_api_url']}&fly_from=CUU&fly_to=MEX&date_from=#{today}&date_to=#{tomorrow}").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip, deflate',
       	  'Host'=>'api.skypicker.com',
       	  'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.4.0p0'
           }).
         to_return(status: 200, body: '{"airlinesList":[{"filterName":"VB"},{"filterName":"AM"},{"filterName":"4O"},{"filterName":"VW"},{"filterName":"YQ"},{"filterName":"UA"},{"filterName":"Y4"}],"search_params":{"to_type":"airport","flyFrom_type":"airport","seats":{"infants":0,"passengers":1,"adults":1,"children":0}},"hashtags":[{"count":9,"name":"duration:4-5"},{"count":16,"name":"departure:20-21"},{"count":2,"name":"duration:10-11"},{"count":111,"name":"duration:2-3"},{"count":42,"name":"tuesday"},{"count":10,"name":"arrival:5-6"},{"count":111,"name":"direct"},{"count":29,"name":"duration:9-10"},{"count":8,"name":"departure:11-12"},{"count":9,"name":"duration:6-7"},{"count":12,"name":"arrival:14-15"},{"count":2,"name":"duration:12-13"},{"count":29,"name":"saturday"},{"count":1,"name":"duration:17-18"},{"count":2,"name":"arrival:8-9"},{"count":4,"name":"departure:10-11"},{"count":4,"name":"departure:6-7"},{"count":9,"name":"sunday"},{"count":33,"name":"thursday"},{"count":1,"name":"duration:19-20"},{"count":32,"name":"departure:16-17"},{"count":47,"name":"departure:21-22"},{"count":9,"name":"arrival:19-20"},{"count":32,"name":"arrival:7-8"},{"count":18,"name":"departure:17-18"},{"count":70,"name":"departure:8-9"},{"count":82,"name":"evening"},{"count":1,"name":"arrival:21-22"},{"count":28,"name":"monday"},{"count":4,"name":"arrival:13-14"},{"count":14,"name":"arrival:23-24"},{"count":16,"name":"arrival:15-16"},{"count":30,"name":"friday"},{"count":89,"name":"1stop"},{"count":4,"name":"arrival:10-11"},{"count":3,"name":"duration:11-12"},{"count":6,"name":"arrival:9-10"},{"count":1,"name":"arrival:17-18"},{"count":6,"name":"duration:13-14"},{"count":5,"name":"duration:8-9"},{"count":1,"name":"departure:18-19"},{"count":29,"name":"wednesday"},{"count":86,"name":"morning"},{"count":4,"name":"arrival:0-1"},{"count":51,"name":"afternoon"},{"count":3,"name":"duration:7-8"},{"count":43,"name":"arrival:20-21"},{"count":39,"name":"arrival:11-12"},{"count":3,"name":"arrival:18-19"},{"count":19,"name":"duration:5-6"}],"connections":[],"currency":"EUR","all_stopover_airports":["MTY","GDL","TIJ"],"_results":1,"airportsList":[{"filterName":"MTY","name":"Monterrey International"},{"filterName":"GDL","name":"Guadalajara International"},{"filterName":"TIJ","name":"Tijuana International"}],"currency_rate":1.0,"all_prices":{"119-126":18,"60-63":15,"84-89":4,"47-50":5,"79-84":10,"50-53":12,"67-71":11,"94-100":14,"106-112":6,"126-133":15,"63-67":5,"56-60":12,"89-94":13,"53-56":4,"100-106":10,"112-119":30,"71-75":14,"75-79":2},"location_hashtags":["sightseeing&culture"],"data":[{"quality":76.066594,"flyTo":"MEX","mapIdto":"mexico-city","nightsInDest":null,"airlines":["Y4"],"pnr_count":1,"fly_duration":"2h 8m","baglimit":{"hand_length":57,"hold_height":52,"hand_height":40,"hold_length":78,"hold_weight":25,"hand_width":33,"hold_dimensions_sum":158,"hold_width":28,"hand_weight":7},"has_airport_change":false,"distance":1246.16,"bags_price":{"1":26.66,"2":53.33},"flyFrom":"CUU","dTimeUTC":1557455520,"p2":1,"p3":1,"p1":1,"dTime":1557433920,"found_on":["deprecated"],"booking_token":"oKWrjE3p79Fphzv+baF3C2h1PDgCet9WaEXSzPuPgCEAv+on9q2YST\/DjPlyl3WZuKwoHy5r5npNKffSIiTmgEoqIII\/4MOeqSv45Ic1qZrLNHUUn0mdtcDi43sI\/sXTeaxMbpZh1pdS2JkU5DHmqR7SN4JDgmO9iFQ6APAVZk\/0xWDSlosgGnLGUW6YfjWdTJylfmCeferoMZoxlpyegyV+BZc3GHK6Sd0CkH2v7+bjL4lPrmX7Pk6+pdDQyWTnhZphBw54bcBeR\/6ZCqv8z\/\/CBt7qB1OATkxuvZaR26\/bo+w0mLsAUKeN7wkerFYwPHeV7N9cHkLGsw5KLF9csvc0UdQQtz\/zEjC7m\/eBKkyRq+oSbyN+XclapA86HKnbtCTUmPQfa\/qt8R72yyhi9Bzuly16czGamk7KxnTSFlF6yuNpXdJLeMBPohjjcXKUAmxFr12O3sjC0wQj3iUHDcV82dXjgw3nUFifBOqQbq29S1rPXYFbQEDxBBhY53ToRvDf\/udAYCPPni1D3IK0+FYjBVbZZ3\/TTW65uoc8Ghl5ojgmoCC0U2YLktr2HNp47FcwdY0m4z7k+bE60xsO4PJ0qzk2fg9sbdQ4kcd3AFNjuuSewUnVFg8tiL2xqnnhlERBGsBY\/zsPj7LkEkQu2yPh+rvHN0jba9+OtCpOBDlPc6E8yCPHzMtg0zUhrhP+7JXxCWs6CGFLJEsjTUggA6ayJ6zHvXnEYTq2r+SjfDY=","cityFrom":"Chihuahua","mapIdfrom":"chihuahua","hashtags":["evening","thursday","direct","duration:2-3","departure:20-21","arrival:23-24"],"duration":{"total":7680,"return":0,"departure":7680},"id":"1cf30789466900009e7e7ce1_0","conversion":{"EUR":47},"countryTo":{"code":"MX","name":"Mexico"},"aTimeUTC":1557463200,"price":47,"cityTo":"Mexico City","transfers":[],"route":[{"aTimeUTC":1557463200,"refresh_timestamp":0,"bags_recheck_required":false,"return":0,"latTo":19.436389,"flight_no":5727,"price":1,"original_return":0,"operating_carrier":"","cityTo":"Mexico City","mapIdfrom":"chihuahua","lngFrom":-105.96444,"vehicle_type":"aircraft","flyFrom":"CUU","id":"1cf30789466900009e7e7ce1_0","dTimeUTC":1557455520,"equipment":null,"mapIdto":"mexico-city","combination_id":"1cf30789466900009e7e7ce1","dTime":1557433920,"fare_family":"","found_on":"deprecated","flyTo":"MEX","source":"deprecated","latFrom":28.702778,"airline":"Y4","fare_classes":"J","lngTo":-99.072222,"cityFrom":"Chihuahua","last_seen":1555630811,"aTime":1557445200,"guarantee":false,"fare_basis":"JLRP1"}],"facilitated_booking_available":true,"routes":[["CUU","MEX"]],"aTime":1557445200,"countryFrom":{"code":"MX","name":"Mexico"}}],"ref_tasks":[],"best_results":[{"sort":"price","duration":7680,"price":47,"quality":76.066594}],"refresh":[],"del":0,"all_airlines":["VB","AM","4O","VW","YQ","UA","Y4"],"time":1,"search_id":"4066558b-6626-4a99-a74c-79c6db498966"}
', headers: {})

 
  end

		it 'by origin and destination' do
			get :search, params: { fly_from: "CUU", fly_to: "MEX", date_from:today , date_to:tomorrow }  
			expect(response.body).to include("CUU")
			expect(response.content_type).to eq "application/json"
		end
	end
   
end
