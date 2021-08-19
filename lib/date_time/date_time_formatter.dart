import 'dart:convert';

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Понедельник", "2" : "Вторник", "3" : "Среда", "4" : "Четверг", "5" : "Пятница", "6" : "Суббота", "7" : "Воскресенье" }';

  dynamic monthData =
      '{ "1" : "Января", "2" : "Февраля", "3" : "Марта", "4" : "Апреля", "5" : "Мая", "6" : "Июня", "7" : "Июля", "8" : "Августа", "9" : "Сентября", "10" : "Октября", "11" : "Ноября", "12" : "Декабря" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}