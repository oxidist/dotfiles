#!/usr/bin/python
import requests

location = "462002"
dump = (requests.get('http://wttr.in/{}?format=j1'.format(location)).json())['current_condition'][0]
temp = dump["temp_C"]

print("{}°C".format(temp))
