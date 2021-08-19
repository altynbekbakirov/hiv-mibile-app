import 'package:HIVApp/Enums/chapter_type.dart';
import 'package:HIVApp/data/pref_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PageCategory extends ChangeNotifier{
  int _selectedPage = 1;

  int get selectedPage => Prefs.getInt("SelectedChapter") ?? _selectedPage;

  void _changeSelectedPage(int newValue) {
    Prefs.setInt("SelectedChapter", newValue);
  }

  /// Получем проценты прочитанных глав
  double getPercent(int chapter){
    switch(chapter){
      case 0:
        return Prefs.getDouble(Prefs.CHAPTER_ONE) ?? 0;
      case 1:
        return Prefs.getDouble(Prefs.CHAPTER_TWO) ?? 0;
      case 2:
        return Prefs.getDouble(Prefs.CHAPTER_THREE) ?? 0;
      case 3:
        return Prefs.getDouble(Prefs.CHAPTER_FOUR) ?? 0;
      case 4:
        return Prefs.getDouble(Prefs.CHAPTER_FIVE) ?? 0;
      case 5:
        return Prefs.getDouble(Prefs.CHAPTER_SIX) ?? 0;
      case 6:
        return Prefs.getDouble(Prefs.CHAPTER_SEVEN) ?? 0;
      case 7:
        return Prefs.getDouble(Prefs.CHAPTER_EIGHT) ?? 0;
      default:
        return 0.0;
    }
  }

  /// Сохраняем процент прочитанных глав
  void setPercent(double value, Chapter chapter) {
    _changeSelectedPage(chapter.index + 1);
    switch(chapter){
      case Chapter.one:
        Prefs.setDouble(Prefs.CHAPTER_ONE, value);
        return;
      case Chapter.two:
        Prefs.setDouble(Prefs.CHAPTER_TWO, value);
        return;
      case Chapter.three:
        Prefs.setDouble(Prefs.CHAPTER_THREE, value);
        return;
      case Chapter.four:
        Prefs.setDouble(Prefs.CHAPTER_FOUR, value);
        return;
      case Chapter.five:
        Prefs.setDouble(Prefs.CHAPTER_FIVE, value);
        return;
      case Chapter.six:
        Prefs.setDouble(Prefs.CHAPTER_SIX, value);
        return;
      case Chapter.seven:
        Prefs.setDouble(Prefs.CHAPTER_SEVEN, value);
        return;
      case Chapter.eight:
        Prefs.setDouble(Prefs.CHAPTER_EIGHT, value);
        return;
    }
  }
}