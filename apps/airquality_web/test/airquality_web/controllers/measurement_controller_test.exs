defmodule AirqualityWeb.MeasurementControllerTest do
  use AirqualityWeb.ConnCase

  import Mox
  import Airquality.Factory

  alias Airquality.Sources.OpenAQMock, as: Mock

  setup :verify_on_exit!

  describe "returns measurements" do
    test "when filtering by location id" do
      measurement = insert(:measurement)

      Mock
      |> expect(:get_latest_measurements, fn _id -> [measurement] end)

      conn = get(build_conn(), "api/locations/#{measurement.location.id}/measurements", [])

      assert json_response(conn, 200) == %{
               "data" => [
                 %{
                   "attributes" => %{
                     "parameter" => "pm10",
                     "unit" => "ppm",
                     "value" => 13.2,
                     "measured-at" => "2019-01-01T00:00:00.000000Z"
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "#{measurement.id}",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "pm25",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                   },
                   "id" => "",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "so2",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "no2",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "o3",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "co",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "",
                   "type" => "measurement"
                 },
                 %{
                   "attributes" => %{
                     "measured-at" => nil,
                     "parameter" => "bc",
                     "unit" => nil,
                     "value" => nil
                   },
                   "relationships" => %{
                     "location" => %{
                       "data" => %{
                         "id" => "#{measurement.location.id}",
                         "type" => "location"
                        }
                      }
                    },
                   "id" => "",
                   "type" => "measurement"
                 }
               ],
               "jsonapi" => %{"version" => "1.0"}
             }
    end
  end
end
