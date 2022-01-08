---
slug: /overview
sidebar_position: 3
---

# App Overview

## Design
We are building a weather app, which:
- Shows weather for selected location
  - Tempeature
  - UV Level
  - Humidity
  - Weather Status Icon
  - Weather Status Description
- Shows list of weather forecast for upcoming days
  - Weather Status Icon
  - Min / Max Tempeature
- Pull to refresh temperature
- Adapts light / dark mode

There are 3 UI components we will be tackling:
1. [App Bar](/tutorial/1-widgets/1a-appbar.md):

  ![App Bar](/img/docs/overview/app-bar.png)
2. [Weather Overview](/tutorial/1-widgets/1b-weather-overview.md):

  ![Weather Overview](/img/docs/overview/weather-overview.png)
3. [Weather Forecast List](/tutorial/1-widgets/1c-forecast-list.md):

  ![Weather Forecast List](/img/docs/overview/forecast-list.png)

For more reference, you can play around with the fully interactive Figma file:

<iframe width="800" height="450" src="https://www.figma.com/embed?embed_host=share&url=https%3A%2F%2Fwww.figma.com%2Ffile%2FoTfK4t50rfSdkTwjLRauvn%2FWeather-App-(Flutter-Lunch-and-Learn)%3Fnode-id%3D0%253A1"></iframe>

## Data
All the data are fetched from Hong Kong Observatory using their [Open Data Public API](https://www.hko.gov.hk/en/weatherAPI/doc/files/HKO_Open_Data_API_Documentation.pdf)

:::info
As the aim for this tutorial is a high level understanding of the Flutter framework, all the network calls and data handling are abstracted away from you, hosted in a separate package under `packages/hko_weather_provider`. Feel free to take a look if you are interested.
:::

There are two main types of data we will be handling in building the app:
- `WeatherStation`, which represents a data from a weather station and contains:
  - Station Name
  - Tempeature
  - UV Level
  - Humidity
  - Weather Status (include icon and description data)
- `Forecast`, which represents a day of weather forcast and contains:
  - Date and Weekday name
  - Wind description
  - Min / Max tempeature
  - Min / Max humidity
  - Rain probability
  - Weather Status (include icon and description data)

:::caution
Note that `WeatherStaion` is location specific, while `Forecast` applies for all of Hong Kong

Therefore, when user is choosing a location form the app bar, we should pick the correct `WeatherStation` according to the name. No actions need to be done on `Forecast`
:::

Specifically, we will be calling two methods to get the data:
- `getCurrentWeather`, which returns a `CurrentWeatherResponse`, 
- `getWeatherForecast`, which returns a `ForecastResponse`, each representing a different day of weather forecast.

The detail of the responses are as follows:
- `CurrentWeatherResponse` contains:
  - A list of `WeatherStation`
- `ForecastResponse` contains:
  - The general description of weather
  - A list of `Forecast`

:::danger
Due to the nature of the HKO API, the general description returned in a `ForecastResponse` is **actually the weather description of the current weather, and is what we will be displaying in the `WeatherOverview` widget**.

This is confusing for sure. We will mentioning this in future steps as well.
:::

We will get into them in details in [Step 2 - API Call and State Logic](/tutorial/2-api-call-and-state.md).