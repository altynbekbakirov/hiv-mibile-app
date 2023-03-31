import 'package:hiv/routes/routes.dart';
import 'package:hiv/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchoolPage extends StatefulWidget {
  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {

  double fontSize = 18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('school'.tr()),
      ),
      body: Container(
        alignment: Alignment(-0.3,-1.0),
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          child: ListView(
            shrinkWrap: true,
            children: [
              Divider(),
              ListTile(
                title: Text(
                  'information_on_arv'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                onTap: (){
                  Navigator.pushNamed(context, Routes.schema_of_arv);
                },
              ),
              Divider(),
              BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.patientSchool);
                },
              ),
              BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.home);
                },
              ),
              ListTile(
                  title: Text(
                    'Тестирование на ВИЧ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Route route =
                    MaterialPageRoute(builder: (context) => TextBody(fontSize: fontSize, title: 'Тестирование на ВИЧ', type: 1,));
                    Navigator.push(context,route);
                  }),
              Divider(),
              ListTile(
                  title: Text(
                    'Виды тестирования',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {Route route =
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: fontSize, title: 'Виды тестирования', type: 2,));
                  Navigator.push(context,route);}
              ),
              Divider(),
              ListTile(
                  title: Text(
                    'Результаты тестов',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () { Route route =
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: fontSize, title: 'Результаты тестов', type: 3,));
                  Navigator.push(context,route);}
              ),
              Divider(),
              ListTile(
                  title: Text(
                    'Самотестирование на ВИЧ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  onTap: () {Route route =
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: fontSize, title: 'Самотестирование на ВИЧ', type: 4,));
                  Navigator.push(context,route);}
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBody extends StatefulWidget {
  double fontSize;
  String title;
  int type;

  TextBody({this.fontSize, this.title, this.type});

  @override
  _TextBodyState createState() => _TextBodyState();
}

class _TextBodyState extends State<TextBody> {

  Widget _myListView1(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ВИЧ-инфекция в Кыргызской Республике регистрируется с 1987 года, '
                        'а первый случай среди граждан Кыргызстана был выявлен в 1996 году. '
                        'На 1 октября 2020 года в стране выявлено 10 173 людей с ВИЧ. '
                        'ВИЧ-инфекция зарегистрирована во всех регионах страны.\n Люди, '
                        'живущие с ВИЧ (ЛЖВ), имеют бесплатный доступ к лечению, уходу и '
                        'поддержке в связи с ВИЧ. Выявление ВИЧ-инфекции позволяет своевременно '
                        'начать лечение, сохранить здоровье и предупредить развитие других сопутствующих '
                        'ВИЧ инфекций. Однако, еще много людей не проходили тестирование на ВИЧ и не знают о своем статусе.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+4, color: Theme.of(context).cursorColor,),
                  text: '\n\nДля чего нужно пройти тест на ВИЧ?'
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Если человек знает, что он инфицирован ВИЧ, он может '
                        'своевременно начать лечение, которое сохраняет здоровье и позволяет '
                        'людям, живущим с ВИЧ, дожить до глубокой старости. Лечение ВИЧ-инфекции '
                        'проводится бесплатно и его можно получить во всех городах и селах Кыргызской Республики.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Если человек знает, что он инфицирован ВИЧ, '
                        'он будет предпринимать меры предосторожности, чтобы не '
                        'передать ВИЧ своему половому партнеру и/или своему будущему ребенку.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+4, color: Theme.of(context).cursorColor,),
                  text: '\n\nКак проводится тест на ВИЧ?'
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Определить наличие в организме ВИЧ можно только при '
                        'помощи лабораторного обследования, которое называется тестированием на ВИЧ или тест на ВИЧ.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Тестирование на ВИЧ является добровольной процедурой, '
                        'то есть никто не вправе заставить человека пройти тест на ВИЧ без его согласия'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Обращение за тестированием и его результаты '),
                    TextSpan(text: 'являются медицинской тайной ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' и не могут разглашаться третьим лицам без согласия ЛЖВ. Это называется '),
                    TextSpan(text: ' конфиденциальность. ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Они могут использоваться только медицинскими работниками, которые проводят наблюдение за ЛЖВ.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Тестирование на ВИЧ можно пройти в '),
                    TextSpan(text: 'Центрах СПИД', style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary),),
                    TextSpan(text: ' и'),
                    TextSpan(text: ' любой медицинской организации. ',  style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary),),
                    TextSpan(text: 'Тестирование на ВИЧ можно пройти в Центрах СПИД и любой медицинской организации.\n'
                        'Кроме того, в некоторых регионах нашей страны тестирование '
                        'на ВИЧ проводят сотрудники'),
                    TextSpan(text: ' неправительственных организаций. ',  style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary),),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Самотестирование на ВИЧ', style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary, fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – Вы можете сделать тест на ВИЧ самостоятельно. '
                        'Детальную информацию об этом Вы можете найти на сайте Республиканского центра СПИД по ссылке: '),
                    TextSpan(text: 'www.aidscenter.kg. ', style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary,)),
                    TextSpan(text: ' Эти тесты Вы можете получить бесплатно с понедельника по пятницу по адресу: '
                        'г. Бишкек, улица Логвиненко 8, 7-8-9 кабинет. Телефон для справок: 0774 42-08-66. '),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Для тестирования на ВИЧ, обычно берут кровь из вены; '
                        'но может использоваться кровь из пальца, а в НПО тестирование проходят по слюне.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Проведение анализа занимает от 30 минут до суток, в зависимости от используемого метода.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Если первый тест указывает на наличие в организме ВИЧ (то есть результат теста '
                        'на ВИЧ положительный), то его перепроверяют несколько раз (не менее 3) '),
                    TextSpan(text: 'разными тестами, ', style: TextStyle(decoration: TextDecoration.underline, color: kColorPrimary,)),
                    TextSpan(text: 'чтобы не ошибиться.  Человеку сообщают только полностью подтвержденный результат. Иногда '
                        'тест на ВИЧ дает неопределенный (сомнительный) результат – тогда обследуемому лицу предлагаю '
                        'пройти тест повторно через 14 дней. Это может быть связано с недавним заражением ВИЧ либо с другими причинами.'),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Каждое тестирование на ВИЧ сопровождается беседой с врачом /социальным работником, '
                        'которая называется консультированием. При консультировании определяют возможные риски заражения, '
                        'дают рекомендации по безопасному поведению, предоставляют адреса профилактических программ, '
                        'а также рассказывают о процедуре тестирования.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: kColorLightBlue, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Следует помнить, что результаты тестов, проведенных на базе '
                        'НПО или при самотестировании на ВИЧ являются предварительными и требуют обязательного подтверждения в организации здравоохранения. '
                        'Человек, у которого впервые обнаружена ВИЧ-инфекция, может получить поддержку от своих близких или представителей НПО.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Image.asset('assets/images/adresa.png'),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView2(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Виды и порядок прохождения тестирования на ВИЧ в Кыргызской Республике\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Согласно закону «О ВИЧ/СПИДе в Кыргызской Республике» (статьи 7-9 Закона) '
                        'бывают следующие виды медицинского освидетельствования (тестирования на ВИЧ):',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(text: '\nдобровольное;'),
                    TextSpan(text: '\nобязательное;'),
                    TextSpan(text: '\nпринудительное.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Факт прохождения и результаты конфиденциального медицинского освидетельствования на ВИЧ '
                        'не разглашаются и не передаются третьей стороне без предварительного письменного согласия обследуемого лица.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Обязательное медицинское освидетельствование ',),
                    TextSpan(text: 'проводится конфиденциально.', style: TextStyle(fontWeight: FontWeight.normal)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Принудительное освидетельствование на ВИЧ ',),
                    TextSpan(text: 'проводится только по решению суда на основании постановления следователя, '
                        'прокурора о его назначении. Факт и результаты такого освидетельствования также носят '
                        'конфиденциальный характер, охраняемый законом.', style: TextStyle(fontWeight: FontWeight.normal)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Любое медицинское освидетельствование на ВИЧ сопровождается дотестовым и послетестовым психосоциальным консультированием. ',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Освидетельствуемое лицо имеет право отказаться от '
                        'проведения медицинского освидетельствования на любой его стадии, '
                        'за исключением принудительного медицинского освидетельствования.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor,),
                  text: 'Обязательное медицинское освидетельствование на ВИЧ'
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Обязательному медицинскому освидетельствованию на ВИЧ подлежат:'
                        'доноры крови, биологических жидкостей, органов и тканей;'
                        'иностранные граждане и лица без гражданства в случаях, предусмотренных международными договорами;'
                        'медицинские работники некоторых специальностей (оперирующие хирурги, сотрудники центров крови и некоторые другие).',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Работодатели не имеют права требовать от работников представления '
                        'официального медицинского заключения освидетельствования на ВИЧ, если это не '
                        'предусмотрено законодательством Кыргызской Республики.\n\n'),
                    TextSpan(text: 'Обязательное медицинское освидетельствование проводится только с письменного согласия обследуемого лица.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Медицинское освидетельствование детей в возрасте до 18 лет и лиц, '
                        'признанных недееспособными, может проводиться по письменной просьбе или письменного '
                        'согласия их законных представителей, которые имеют право присутствовать при проведении медицинского освидетельствования.'
                        'Психосоциальное консультирование детей в возрасте до 18 лет проводится с участием детского психолога, '
                        'родителей или законного представителя, которые приглашаются с согласия ребенка.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Не допускается какое-либо принуждение при проведении медицинского освидетельствования на ВИЧ, '
                        'проведение его без согласия обследуемого лица либо с использованием методов физического, психологического и '
                        'морального давления, равно как с использованием зависимого положения освидетельствуемого лица.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Выдача официального медицинского заключения по результатам медицинского освидетельствования на '
                        'ВИЧ (СЕРТИФИКАТ) о наличии или отсутствии у них ВИЧ-инфекции выдается только в Центрах СПИДа.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Сведения о заражении того или иного лица вирусом иммунодефицита человека либо о заболевании его ВИЧ-инфекцией, '
                        'СПИДом составляют служебную тайну, охраняемую законом.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Освидетельствование на ВИЧ проводится по Правилам, утвержденным Правителством Кыргызской Республики. '
                        'Правила определяют порядок проведения и показания для проведения обследования на ВИЧ. Обследование проводится всем '
                        'донорам крови и органов, а также медицинским работникам. Обследование также рекомендуется людям, имеющим поведенческие '
                        'риски: потребление наркотиков путем инъекций, имеющих случайные или множественные половые контакты, имеющие проявления '
                        'инфекций, передающихся половым путем (ИППП). Обследованию подлежат беременные женщины для профилактики передачи ВИЧ '
                        'новорожденным детям. Обследование на ВИЧ предлагается всем людям, у кого имеются проявления болезни, похожие на '
                        'ВИЧ-инфекцию (перечень этих заболеваний определяет Министерство здравоохранения КР). ',),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView3(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Результаты тестирования на ВИЧ – установление ВИЧ-статуса\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Диагноз ВИЧ-инфекции устанавливается лабораторным методом. Чаще всего определяют антитела к ВИЧ – это белки крови,'
                        ' которые вырабатываются в случае попадания ВИЧ в организм человека. Установление диагноза ВИЧ-инфекции – это очень ответственный'
                        ' процесс. Для этого пробу крови пациента проверяют несколько раз с использованием разных лабораторных методов, чтобы избежать ошибки.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 2, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Результаты тестирования на ВИЧ:'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Отрицательный результат теста на ВИЧ ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– означает, что в организме человека не выявлены антитела к ВИЧ. Это может означать, что человек не инфицирован ВИЧ. '
                        'Однако, в некоторых случаях тест может давать отрицательный результат, когда внтитела еще не выработались в организме – это называется '),
                    TextSpan(text: '“Период окна”', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '. Такой результат может наблюдаться, если заражение произошло недавно – менее 14 дней до прохождения обследования. '
                        'В таком случае тест нужно будет повторить. Если Вы знаете, что опасный контакт был недавно, лучше обратиться за тестированием '
                        'через 14 дней. Отрицательный результат теста означает, что нужно и в дальнейшем принимать меры защиты от инфицирования ВИЧ. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Положительный результат теста на ВИЧ ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это выявление в организме человека антител к ВИЧ. Ели положительный результат теста выявлен при экспресс '
                        'тестировании на базе НПО или при самотестировании – он обязательно должен быть подтвержден лабораторными методами. '
                        'Положительный результат теста на ВИЧ означает, что Вам следует как можно скорее обратиться к врачу для начала лечения – '
                        'антиретровирусной терапии (АРТ). АРТ позволяет сохранить здоровье и жизнь человеку, живущему с ВИЧ. Следует также предпринять '
                        'меры  предупреждения заражения ВИЧ половых партнеров. Врачи рекомендуют информировать партнеров и провести их обследование '
                        'на ВИЧ. Инфицирование ВИЧ не означает, что Вам не нужно более предпринимать меры защиты от ВИЧ-инфекции. Человек, живущий с '
                        'ВИЧ может повторно заразится другим видом этого вируса и в таком случае заболевание будет протекать тяжелее. Кроме того, можно '
                        'заразиться также ИППП или другими инфекциями, имеющими такие же пути передачи – например вирусными гепатитами В и С.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Неопределенный результат теста на ВИЧ  ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– результат, когда не удается определить ВИЧ-статус. Это возможно при раннем обращении за '
                        'тестированием на ВИЧ, когда еще в организме не выработаны антитела. Может быть также при некоторых заболеваниях, '
                        'не связанных с ВИЧ. В таком случае рекомендуют сдать кровь повторно через 14 дней. Это также означает, что следует '
                        'строго соблюдать меры предосторожности для предупреждения заражения ВИЧ своих половых партнеров.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Ложноположительный результат теста на ВИЧ ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это лица с положительными результатами теста на ВИЧ, но у которых ВИЧ-инфекция на самом деле '
                        'отсутствует. Для этого специалисты подтверждают положительный результат несколькими разными методами, '
                        'а иногда рекомендуют пройти тестирование на ВИЧ повторно (через 21 день).\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.normal, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Ложноотрицательный результат теста на ВИЧ ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '– это лица с отрицательными результатами теста на ВИЧ, но у которых ВИЧ инфекция на самом деле присутствует.'
                        ' Поэтому, если человек практикует опасное поведение, ему рекомендуется проходить тестирование на ВИЧ 1-2 раза в год. '
                        'В настоящее время применяются совершенные методы диагностики, которые позволяют исключить ложные результаты теста. '
                        'При проведении экспресс-тестирования на ВИЧ по слюне на базе НПО или при самотестировании на ВИЧ, ложноотрицательные '
                        'результаты могут быть при неправильном заборе материала (слюны).'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView4(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Что такое самотест?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Самотестирование на ВИЧ – это проведение тестирования на ВИЧ самостоятельно без участия медицинских работников. '
                        'Тестирование проводится по слюне. Это экспресс-тест, что позволяет узнать результат за 20 минут. Сейчас набор для '
                        'самотестирования на ВИЧ можно получить в Центре СПИД или в некоторых НПО. Ожидается, что вскоре их можно будет купить в аптеке. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Преимущества самотестирования на ВИЧ.\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Самотестирование на ВИЧ является надежным и удобным методом для контроля своего ВИЧ-статуса. Особенно это важно'
                        ' для лиц, которые практикуют опасное поведение, но не решаются обратиться в организацию здравоохранения. Вы можете сами '
                        'выбрать время и место для проведения теста. Вы можете проводить самотестирование совместно с другом /подругой. По Вашему '
                        'желанию можно также пройти ассистированное самотестирование на ВИЧ при поддержке представителей НПО. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Как работает самотест?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Этот тест, как и многие другие тесты, определяет наличие в организме не вируса, а антител к вирусу '
                        '(то есть белков, которые вырабатывает организм на внедрение вируса). \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Что включает набор для самотестирования на ВИЧ?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Пакет для самотестирования на ВИЧ включает помимо самого набора для тестирования детальную инструкцию о его '
                        'проведении тестирования и оценке результатов теса, а также рекомендации по более безопасному поведению, а также презервативы. \n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Как провести тест?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Для этого нужно найти удобное место и время, чтобы Вам никто не помешал, особенно если Вы не хотите, '
                        'чтобы кто-либо знал о Вашем намерении пройти тестирование.   Прежде всего следует внимательно прочитать инструкцию. '
                        'Подготовить рабочее место и оборудование (см. рис.). Для проведения теста Вас нужно провести тестовой палочкой по верхней'
                        ' и нижней десне. Палочку помещаем в прилагаемую баночку с жидкостью и подождать 20 минут.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Image.asset('assets/images/samotest.jpg'),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Оценка результата теста\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Через 20 минут на в окошке теста появятся полоски. Если одна полоска - то антител на ВИЧ нет. Если Вы увидите '
                        '2 полоски, то результат на ВИЧ положительный, то есть определены антитела к ВИЧ.\n\n Точность теста относительно высока - по '
                        'словам производителя, она составляет: 99%.\n Однако, если у вас было небезопасное поведение относительно недавно, то лучше '
                        'сдать тест спустя 2-3 недели, тогда результат будет более достоверным. Это связано с '),
                    TextSpan(text: 'периодом окна', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: '– то есть периода, когда заражение ВИЧ уже произошло, но антитела не образовались.\n\n В случае, '
                        'если у вас выйдет положительный результат (две полоски), необходимо сдать тест на ВИЧ повторно в Центре СПИД или '
                        'другой медицинской организации.'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Как часто следует проходить тестирование на ВИЧ?\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize:  widget.fontSize + 1,)),
                    TextSpan(text: 'Если Вы сексуально активны и у Вас были случаи опасного поведения (случайные половые контакты, '
                        'множественные партнеры, секс без использования презерватива, либо потребление наркотиков с использованием шприца)'
                        ' рекомендуется проходить исследование на ВИЧ и другие ИППП 1-2 раза в год.\n Напомним, экспресс-тесты вы можете получить '
                        'бесплатно с понедельника по пятницу по адресу : улица Логвиненко 8, 7-8-9 кабинет. Телефон для справок: 0774 42-08-66.\n'),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }

  Widget _getCorrectTextBody(BuildContext context, int type){

    if(type == 1){
      return _myListView1(context);
    }
    else if(type ==2){
      return _myListView2(context);
    }
    else if(type ==3){
      return _myListView3(context);
    }
    else if(type ==4){
      return _myListView4(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            children: [
              Text(widget.title),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,5,0,10),
                child: Slider(
                  value: widget.fontSize,
                  min: 10,
                  max: 50,
                  divisions: 15,
                  label: widget.fontSize.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      widget.fontSize = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        body: _getCorrectTextBody(context, widget.type),
      ),
    );
  }
}