class Hour {
  final String time;
  final String temp;
  final String condition;

  Hour({
    required this.time,
    required this.temp,
    required this.condition,
  });

  factory Hour.fromJson(jsonData) {
    return Hour(
      time: jsonData['time'].toString().split(' ').last,
      temp: jsonData['temp_c'].toString(),
      condition: jsonData['condition']['text'],
    );
  }
}

List<Hour> setHours(jsonData) {
  List<Hour> hours = [];
  for (var element in jsonData) {
    Hour hour = Hour.fromJson(element);
    hours.add(hour);
  }
  return hours;
}
