# accuweather_pollen

This QuickApp gives access to real-time and 5-day forecast pollen count and risk category for grass pollen, mold spores, ragweed pollen and tree pollen of any location from Accuweather.com

Pollen is a fine powder produced by trees and plants
Pollen can severely affect people, especially those with different ailments such as asthma and respiratory issues.
It can aggravate these existing conditions or cause these issues in high risk groups

Grass Pollen: Pollen grains from grasses
Mold Spores: The fungus produces spores that can become airborne
Radweed Pollen: Ragweeds are annual and perennial herbs and shrubs. A single plant may produce about a billion grains of pollen per season. 
Tree Pollen: Pollen from trees such as Birch and Oak

The QuickApp provides a risk evaluation with levels in particles/m³

Grass Pollen
- Category Name  Begin Range  End Range
- Low            0            4.99
- Moderate       5            19.99
- High           20           199.99
- Very High      200	          299.99
- Extreme        300          1000000

Mold Spores
- Category Name  Begin Range  End Range
- Low            0            6499.99
- Moderate       6500         12999.99
- High	          13000        49999.99
- Very High      50000        64999.99
- Extreme        65000        1000000

-Ragweed Pollen
- Category Name  Begin Range  End Range
- Low            0            9.99
- Moderate       10           49.99
- High           50           499.99
- Very High      500          649.99
- Extreme        650          1000000
 
Tree Pollen
- Category Name  Begin Range  End Range
- Low            0            14.99
- Moderate       15           89.99
- High           90           1499.99
- Very High      1500         2999.99
- Extreme        3000         1000000


IMPORTANT
- You need an API key from https://developer.accuweather.com
- The API is free up to 50 API calls/day, one key


Version 0.1 (22th August 2021)
- Initial version
- ToDo: convert remaining date/time to format


Variables (mandatory): 
- apiKey = Get your free API key from AccuWeather
- locationKey =  AccuWeather number from your HC3 Lon/Lat
- interval = [number] in seconds time to get the data from the API
- timeout = [number] in seconds for http timeout
- debugLevel = Number (1=some, 2=few, 3=all, 4=simulation mode) (default = 1)
- icon = [numbber] User defined icon number (add the icon via an other device and lookup the number)
