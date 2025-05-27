final Map<String, dynamic> forecastData = const {
  "location": {"name": "New York", "country": "United States of America"},
  "current": {
    "temperature": 6,
    "weather_descriptions": ["Sunny"],
    "weather_icons": [
      "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
    ],
  },
  "forecast": {
    "2024-03-18": {
      "mintemp": 5,
      "maxtemp": 10,
      "uv_index": 4,
      "astro": {"sunrise": "07:02 AM", "sunset": "07:07 PM"},
    },
    "2024-03-19": {
      "mintemp": 1,
      "maxtemp": 8,
      "uv_index": 4,
      "astro": {"sunrise": "07:00 AM", "sunset": "07:08 PM"},
    },
    "2024-03-20": {
      "mintemp": 4,
      "maxtemp": 10,
      "uv_index": 4,
      "astro": {"sunrise": "06:59 AM", "sunset": "07:09 PM"},
    },
    "2024-03-21": {
      "mintemp": 0,
      "maxtemp": 7,
      "uv_index": 5,
      "astro": {"sunrise": "06:57 AM", "sunset": "07:10 PM"},
    },
    "2024-03-22": {
      "mintemp": -2,
      "maxtemp": 6,
      "uv_index": 1,
      "astro": {"sunrise": "06:55 AM", "sunset": "07:11 PM"},
    },
    "2024-03-23": {
      "mintemp": 1,
      "maxtemp": 9,
      "uv_index": 2,
      "astro": {"sunrise": "06:53 AM", "sunset": "07:12 PM"},
    },
    "2024-03-24": {
      "mintemp": -3,
      "maxtemp": 7,
      "uv_index": 2,
      "astro": {"sunrise": "06:52 AM", "sunset": "07:13 PM"},
    },
  },
};

final List<Map<String, dynamic>> hourlyForecast = [
  {
    "time": "09:00 AM",
    "temperature": 6,
    "icon":
    "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
  },
  {
    "time": "12:00 PM",
    "temperature": 8,
    "icon":
    "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png",
  },
  {
    "time": "03:00 PM",
    "temperature": 9,
    "icon":
    "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png",
  },
  {
    "time": "06:00 PM",
    "temperature": 7,
    "icon":
    "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0003_white_cloud.png",
  },
  {
    "time": "09:00 PM",
    "temperature": 5,
    "icon":
    "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0003_white_cloud.png",
  },
];