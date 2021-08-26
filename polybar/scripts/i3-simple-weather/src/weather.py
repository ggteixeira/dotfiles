#    i3-simple-weather  Copyright (C) 2020  BrutalWizard (https://github.com/bru74lw1z4rd).
#    This program comes with ABSOLUTELY NO WARRANTY;
#    This is free software, and you are welcome to redistribute it
#    under certain conditions;

# More info about wether at - https://openweathermap.org/weather-conditions
# To show icons from this script you will need to buy "Font Awesome Pro" font - https://fontawesome.com/
# Also you can change icon in arrays to yours icons

import requests
import json

# Settings
city = "Sao Carlos"  # Your town
api_key = "b8ffce771357faf70d51f08d3777f7cf"
units = "metric"  # Unit system {imperial or metric}
temperature_unit = (
    "C"  # Units of measurement. That will be showed in UI. Does not affect on API.
)

icons_list = {
    "01d": "",  # Clear sky - day
    "01n": "",  # Clear sky - night
    "02d": "",  # Few clouds (11-25%) - day
    "02n": "",  # Few clouds (11-25%) - night
    "03d": "",  # Scattered clouds (25-50%) - day/night
    "03n": "",  # Scattered clouds (25-50%) - day/night
    "04d": "",  # Broken / Overcast clouds (51-84% / 85-100%) - day/night
    "04n": "",  # Broken / Overcast clouds (51-84% / 85-100%) - day/night
    "09d": "",  # Shower rain - day
    "09n": "",  # Shower rain - night
    "10d": "",  # Moderate / heavy rain - day
    "10n": "",  # Moderate / heavy rain - night
    "11d": "",  # Thunderstorm - day
    "11n": "",  # Thunderstorm - night
    "13d": "",  # Snow - day
    "13n": "",  # Snow - night
    "50d": "",  # Fog - day
    "50n": "",  # Fog - night
}

atmophere_icons_list = {
    701: "",  # Mist
    711: "",  # Smoke
    721: "",  # Haze
    731: "",  # Dust (Sand / dust whirls)
    741: "",  # Fog
    751: "",  # Sand
    761: "",  # Dust
    762: "",  # Ash
    771: "",  # Squalls
    781: "",  # Tornado
}


def main():
    try:
        # Get data from openweather
        url = (
            "http://api.openweathermap.org/data/2.5/weather?q={}&units={}&appid={}"
        ).format(city, units, api_key)
        result = requests.get(url)

        # If result was received
        if result.status_code == requests.codes["ok"]:
            # Read json
            weather = result.json()

            # Get info from array
            id = int(weather["weather"][0]["id"])
            group = weather["weather"][0]["main"].capitalize()
            icon = weather["weather"][0]["icon"].capitalize()
            temp = int(float(weather["main"]["temp"]))

            # Load another icons for Atmosphere group
            if group == "Atmosphere":
                return atmophere_icons_list[id] + " {}°{}".format(
                    temp, temperature_unit
                )

            return icons_list[icon] + " {}°{}".format(temp, temperature_unit)
        else:
            return ""  # Return reload icon
    except:
        return ""  # Return reload icon


if __name__ == "__main__":
    print(main())
