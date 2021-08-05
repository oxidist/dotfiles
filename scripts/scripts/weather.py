#!/usr/bin/python
import requests

location = "462002"
dump = (requests.get(f'https://wttr.in/{location}?format=j1').json())['current_condition'][0]
temp = dump["temp_C"]

print(f'{temp}°C')
