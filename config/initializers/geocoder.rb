Geocoder.configure(

    # geocoding service (see below for supported options):
    :lookup => :nominatim,
    http_headers: { "User-Agent" => "© OpenStreetMap contributors" }),
  
    # IP address geocoding service (see below for supported options):
    :ip_lookup => :ipinfo_io,
  
    # to use an API key:
    # api_key: Rails.application.credentials.googleapi,
  
    # geocoding service request timeout, in seconds (default 3):
    :timeout => 5,
  
    # set default units to kilometers:
    :units => :km
  
  )