import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

/// Страница "Результы тестов"
class TestResultScreen extends StatefulWidget {
  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  double fontSize = 18;
  bool showSlider = false;

  Widget _appBarWithSizeSlider(BuildContext context) {
    return AppBar(
      leading: Container(),
      titleSpacing: 0.0,
      centerTitle: false,
      title: SliderTheme(
        data: SliderTheme.of(context).copyWith(trackHeight: 15),
        child: Slider(
          value: fontSize,
          min: 18,
          max: 24,
          divisions: 3,
          label: fontSize.round().toString(),
          onChanged: (value) {
            setState(() {
              fontSize = value;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle chapterStyle = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 10,
        fontWeight: FontWeight.w600);

    TextStyle contentItalic = TextStyle(
        color: Colors.black, fontSize: fontSize, fontStyle: FontStyle.italic);

    TextStyle contentNormal =
    TextStyle(color: Colors.black, fontSize: fontSize);

    TextStyle normalBold = TextStyle(
        color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.w600);

    TextStyle normalBoldForChapter = TextStyle(
        color: Colors.black,
        fontSize: fontSize + 6,
        fontWeight: FontWeight.w600);

    Widget _testResultContent() {
      return ListView(children: [
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Как оценить результаты тестирования на ВИЧ\n\n", style: chapterStyle),
              TextSpan(
                text:"Диагноз ВИЧ-инфекции устанавливается лабораторным методом. Чаще всего определяют антитела к ВИЧ – это "
                    "белки крови, которые вырабатываются в случае попадания ВИЧ в организм человека. Установление диагноза "
                    "ВИЧ-инфекции – это очень ответственный процесс. Для этого пробу крови пациента проверяют несколько раз с "
                    "использованием разных лабораторных методов, чтобы избежать ошибки.\n",
                style: contentNormal,
              ),
            ]),
          ),
        ),
        ListTile(
          title: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Результаты тестирования на ВИЧ:\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Отрицательный результат теста на ВИЧ ",
                  style: normalBold),
              TextSpan(
                  text: "– означает, что в организме человека не выявлены антитела к ВИЧ. "
                      "Это может означать, что человек не инфицирован ВИЧ. Однако, в некоторых случаях тест может давать "
                      "отрицательный результат, когда внтитела еще не выработались в организме – это называется ",
                  style: contentNormal),
              TextSpan(
                  text: "“Период окна”.",
                  style: normalBold),
              TextSpan(
                  text: "Такой результат может наблюдаться, если заражение произошло недавно – менее 14 дней до прохождения "
                      "обследования. В таком случае тест нужно будет повторить. Если Вы знаете, что опасный контакт был "
                      "недавно, лучше обратиться за тестированием через 14 дней. Отрицательный результат теста означает, "
                      "что нужно и в дальнейшем принимать меры защиты от инфицирования ВИЧ.\n\n",
                  style: contentNormal),

              TextSpan(
                  text: "Положительный результат теста на ВИЧ\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Это выявление в организме человека антител к ВИЧ. Ели положительный результат теста выявлен при "
                      "экспресс тестировании на базе НПО или при самотестировании – он обязательно должен быть подтвержден "
                      "лабораторными методами. Положительный результат теста на ВИЧ означает, что Вам следует как можно скорее"
                      " обратиться к врачу для начала лечения – антиретровирусной терапии (АРТ). АРТ позволяет сохранить "
                      "здоровье и жизнь человеку, живущему с ВИЧ. Следует также предпринять меры  предупреждения заражения "
                      "ВИЧ половых партнеров. Врачи рекомендуют информировать партнеров и провести их обследование на ВИЧ. "
                      "Инфицирование ВИЧ не означает, что Вам не нужно более предпринимать меры защиты от ВИЧ-инфекции. "
                      "Человек, живущий с ВИЧ может повторно заразится другим видом этого вируса и в таком случае заболевание"
                      " будет протекать тяжелее. Кроме того, можно заразиться другими инфекциями, которые передаются половым "
                      "путем (сифилис, гонорея и др.), а также другими опасными заболеваниями – например, вирусными гепатитами В и С. \n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Неопределенный результат теста на ВИЧ\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Результат, когда не удается определить ВИЧ-статус. Это возможно при раннем обращении за тестированием "
                      "на ВИЧ, когда еще в организме не выработаны антитела. Может быть также при некоторых заболеваниях, не "
                      "связанных с ВИЧ. В таком случае рекомендуют сдать кровь повторно через 14 дней. Это также означает, "
                      "что следует строго соблюдать меры предосторожности для предупреждения заражения ВИЧ своих половых "
                      "партнеров.\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Ложноположительный результат теста на ВИЧ\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Это лица с положительными результатами теста на ВИЧ, но у которых ВИЧ-инфекция на самом деле "
                      "отсутствует. Для этого специалисты подтверждают положительный результат несколькими разными методами,"
                      " а иногда рекомендуют пройти тестирование на ВИЧ повторно (через 21 день).\n\n",
                  style: contentNormal),
              TextSpan(
                  text: "Ложноотрицательный результат теста на ВИЧ\n\n",
                  style: normalBoldForChapter),
              TextSpan(
                  text: "Это лица с отрицательными результатами теста на ВИЧ, но у которых ВИЧ инфекция на самом деле "
                      "присутствует. Поэтому, если человек практикует опасное поведение, ему рекомендуется проходить "
                      "тестирование на ВИЧ 1-2 раза в год. В настоящее время применяются только высококачественные методы "
                      "диагностики, которые позволяют исключить ложные результаты теста. При проведении экспресс-тестирования"
                      " на ВИЧ по слюне на базе НПО или при самотестировании на ВИЧ, ложноотрицательные результаты могут быть"
                      " при неправильном заборе материала (слюны).",
                  style: contentNormal),
            ]),
          ),
        ),
      ]);
    }

    Widget _result() {
      return Scaffold(
        appBar: showSlider ? _appBarWithSizeSlider(context) : null,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: _testResultContent()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("test_results".tr(),
            style: TextStyle(color: Colors.black, fontSize: 18)),
        centerTitle: false,
        titleSpacing: 0.0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            }),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                showSlider = !showSlider;
              });
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text("Aa",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
      body: _result(),
    );
  }
}
