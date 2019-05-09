class CityMapper
    include HTTParty
    base_uri 'https://developer.citymapper.com'

  
    def travel_time(start_at, orgin_coordinates, destination_coordinates)

      request_options = {
            startcoord: orgin_coordinates.join(","),
            endcoord: destination_coordinates.join(","),
            time: start_at.iso8601,
            time_type: "arrival",
            key: ENV["CITYMAPPER_API_KEY"]
             
      }.stringify_keys

      res = self.class.get("/api/1/traveltime/", {query: request_options})
      response = JSON.parse(res.body)

      # TODO: Error handeling here (currenly just returns nil)
      if res.code == 200
        response["travel_time_minutes"]
      end

    end
end
