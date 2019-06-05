#!/usr/bin/python
import pyowm

api_key = 'd2e1cb17172b8247f4eac5f53b458e3c' # get api key from OWM after signing up
owm = pyowm.OWM(api_key)

class WeatherGetter(object):
    # How to enter the argument city:
    #   (your city),(your two letter country code)
    #   for example, the argument for London would be:
    #   'London,gb'

    # How to enter the argument unit:
    #   Enter a string, 'C' or 'F' for Celsius unit or Fahrenheit unit respectively.
    def __init__(self, city, unit):
        self.city = city
        self.unit = unit

    def get_weather_of_city(self):
        weather_in_city = owm.weather_at_place(self.city)
        weather = weather_in_city.get_weather() # returns a Weather object (?)
        return weather

    def get_temp_of_city(self, weather):
        temp_in_kelvin = weather.get_temperature() # Returns a dict
        return temp_in_kelvin

    def get_status_of_city(self, weather):
        status = weather.get_status() # for eg. sunny, clouds, etc.
        return status
    def output_the_weather(self, temp_in_kelvin, status):
        if self.unit is 'C':
            celsius = pyowm.utils.temputils.kelvin_to_celsius(temp_in_kelvin['temp'])
            if status == 'Clouds' or status == 'Haze':
                return ' {}, {}°C'.format(status, celsius)
            elif status == 'Clear':
                return ' {}, {}°C'.format(status, celsius)
            elif (status == 'Rain') or (status == 'Thunderstorm') or (status == 'Drizzle'):
                return ' {}, {}°C'.format(status, celsius)
            elif status == 'Dust':
                return ' {}, {}°C'.format(status,celsius)
        elif self.unit is "F":
            fahrenheit = pyowm.utils.temputils.kelvin_to_fahrenheit(temp_in_kelvin['temp'])
            if status == 'Clouds':
                return ' {}, {}°F'.format(status, fahrenheit)
            elif status == 'Clear':
                return ' {}, {}°F'.format(status, fahrenheit)
            elif status == 'Rains' or status is 'Thunderstorm':
                return ' {}, {}°F'.format(status, fahrenheit)

reporter = WeatherGetter('Bhopal,IN','C')

weather = reporter.get_weather_of_city()

status = reporter.get_status_of_city(weather)
temp = reporter.get_temp_of_city(weather)
print (reporter.output_the_weather(temp, status))

