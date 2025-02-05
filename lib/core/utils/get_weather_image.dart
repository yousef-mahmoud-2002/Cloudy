String getWeatherImage(String condition) {
  switch (condition.toLowerCase()) {
    case "sunny":
      return 'assets/sun.png';

    case "clear":
      return 'assets/moon.png';

    case "partly cloudy":
      return 'assets/lightcloud.png';

    case "cloudy":
    case "overcast":
      return 'assets/heavycloud.png';

    case "mist":
    case "fog":
      return 'assets/showers.png';

    case "patchy rain possible":
    case "light rain":
    case "patchy light rain":
    case "light rain shower":
      return 'assets/lightrain.png';

    case "moderate rain":
    case "heavy rain":
    case "heavy rain at times":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return 'assets/heavyrain.png';

    case "patchy snow possible":
    case "patchy light snow":
    case "light snow":
    case "light snow showers":
      return 'assets/snow.png';

    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return 'assets/thunderstorm.png';

    case "light sleet":
    case "light sleet showers":
    case "ice pellets":
    case "light showers of ice pellets":
      return 'assets/sleet.png';

    case "moderate snow":
    case "heavy snow":
    case "patchy heavy snow":
    case "moderate or heavy snow showers":
    case "patchy freezing drizzle possible":
    case "freezing fog":
    case "light freezing rain":
    case "freezing drizzle":
    case "patchy sleet possible":
    case "light drizzle":
    case "blowing snow":
    case "blizzard":
      return 'assets/hail.png';

    default:
      return 'assets/lightcloud.png';
  }
}
