import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class TreatmentPage extends StatefulWidget {
  @override
  _TreatmentPageState createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {

  double _fontSize = 18;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 1,
        title: Text('hiv_treatment'.tr()),
    ),
    body: Container(
      child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
                title: Text(
                  'Лечение ВИЧ-инфекции',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Что такое ВИЧ?', type: 1,));
                  Navigator.push(context,route);
                }),
            Divider(),
            ListTile(
                title: Text(
                  'АРВП',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'АРВП', type: 2,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Воздействие АРТ ',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Воздействие АРТ ', type: 3,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Преимущества от приема АРТ',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Преимущества от приема АРТ', type: 4,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?', type: 5,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Нежелательные (побочные) эффекты антиретровирусной терапии.',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Нежелательные (побочные) эффекты антиретровирусной терапии.', type: 6,));
                  Navigator.push(context,route);}
            ),
            Divider(),
            ListTile(
                title: Text(
                  'Приверженность к антиретровирусной терапии',
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
                  MaterialPageRoute(builder: (context) => TextBody(fontSize: _fontSize, title: 'Приверженность к антиретровирусной терапии', type: 7,));
                  Navigator.push(context,route);}
            ),
          ],
        ),
      )
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
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ЛЕЧЕНИЕ ВИЧ-инфекции'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Лечение ВИЧ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' - инфекции называется '),
                    TextSpan(text: 'антиретровирусная терапия (сокращенно - АРТ).\n', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'АРТ - это лечение, которое действует против ретровируса – то есть вируса, который вызывает ВИЧ-инфекцию.'),
                  ]
              ),
            ),
          ),
          ListTile(
            tileColor:  Colors.blueGrey,
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor,),
                  children: [
                    TextSpan(text: 'До настоящего времени не разработано лекарство, которое могло бы полностью излечить человека от ВИЧ-инфекции, и нет вакцины, которая могла '
                        'бы защитить от заражения ВИЧ. Поэтому человек с ВИЧ должен постоянно получать лечение.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Для лечения ВИЧ-инфекции используют '),
                    TextSpan(text: 'антиретровирусные препараты (АРВП). ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Они останавливают размножение вируса.  Через 3-6 месяцев после начала лечения количество вируса снижается до очень '),
                    TextSpan(text: 'низкого уровня, ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'которое не определяется при исследовании крови – это называется '),
                    TextSpan(text: 'неопределяемая вирусная нагрузка. ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Container(
              child: Image.asset('assets/images/treatment_image1.png', fit: BoxFit.fitWidth,),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Рис. Вирусная нагрузка – количество вируса в крови до и после лечения.\n'),
                    TextSpan(text: 'Ссылка 3. Антиретровирусные препараты ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize +3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'АРТ останавливает размножение вируса ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'При приеме АРТ иммунная система восстанавливается, увеличивается количество CD4-клеток. Исчезают, или уменьшаются проявления '
                        'ВИЧ-инфекции (если они были ранее). Кроме того, риск заражения ВИЧ полового партнера или будущего ребенка значительно снижается. При раннем '
                        'начале АРТ вирус не успевает нанести вред иммунной системе. Это очень важно, потому что восстановление иммунной системы происходит очень медленно '
                        'и организм остается без защиты даже если вирус уже не размножается в результате приема АРТ.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize +3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Воздействие АРТ на человека с ВИЧ', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.blueGrey,
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'До настоящего времени не разработано лекарство, которое могло бы полностью излечить человека от ВИЧ-инфекции, и нет вакцины, которая могла бы '
                        'защитить от заражения ВИЧ. Поэтому человек с ВИЧ должен постоянно получать лечение.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В мире пока нет лекарств, которые полностью излечивают от ВИЧ-инфекции. Поэтому препараты нужно принимать пожизненно. '
                        'Важно строго соблюдать дозу и время приема лекарств, никогда не прерывать лечение – \n'),
                    TextSpan(text: ' это называется приверженность к лечению.', style: TextStyle(fontWeight:  FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'У ЛЖВ всегда должен быть запас препаратов, не меньше, чем на 1 месяц, который нужно регулярно пополнять, чтобы не было перерывов в лечении. '
                        'Нарушение предписаний врача по приему АРТ может привести к устойчивости вируса к лечению – тогда лекарства не будут действовать на ВИЧ. В таком случае врач '
                        'меняет курс лечения или назначает уже вторую линию препаратов и количество применяемых таблеток увеличивается. \n'),
                    TextSpan(text: 'Препараты для лечения ВИЧ-инфекции (АРВП) предоставляются бесплатно!\n', style: TextStyle(fontWeight:  FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Лечение ВИЧ-инфекции позволяет сохранить здоровье и жизнь человека. '),
                    TextSpan(text: 'Поэтому лечение нужно начинать как можно раньше ', style: TextStyle(fontWeight:  FontWeight.bold)),
                    TextSpan(text: ' – сразу же после установления ВИЧ-статуса и строго соблюдать назначения врача. Антиретровирусная терапия позволяет людям с ВИЧ прожить полноценную и долгую жизнь!'),
                  ]
              ),
            ),
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
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Антиретровирусные препараты'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Column(
              children: [
                Container(
                  child: Image.asset('assets/images/treatment_image2.png', fit: BoxFit.fitWidth,),
                ),
              ],
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Антиретровирусные препараты (АРВП)', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' – это лекарства, которые действуют против ретровируса – то есть вируса, который вызывает ВИЧ-инфекцию.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В настоящее время существует много эффективных препаратов для лечения ВИЧ-инфекции. Важно получать одновременно несколько препаратов, '
                        'которые действуют на разные этапы развития вируса. Современные лекарства включают три разных препарата в одной таблетке. '),
                  ]
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.blueGrey,
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'До настоящего времени не разработано лекарство, которое могло бы полностью излечить человека от ВИЧ-инфекции,'
                        ' и нет вакцины, которая могла бы защитить от заражения ВИЧ. Поэтому человек с ВИЧ должен постоянно получать лечение.\n'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Как действуют антиретровирусные препараты?', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Антиретровирусные препараты не излечивают от ВИЧ-инфекции, а лишь подавляют размножение вируса, обеспечивая контроль над инфекцией. С целью максимального эффекта от лечения в ',),
                    TextSpan(text: 'настоящее время применяются трехкомпонентные схемы лечения,', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                    TextSpan(text: ' то есть содержащие три антиретровирусных препарата в одной таблетке.',),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В Кыргызстане применяются антиретровирусные препараты, которые обладают разным действием на ВИЧ:',),
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
                    TextSpan(text: 'Такие препараты, как зидовудин, ламивудин, невирапин, эфавиренц нарушают процесс размножения ВИЧ внутри клетки.',style: TextStyle(fontStyle: FontStyle.italic)),
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
                    TextSpan(text: 'Лопинавир/ритонавир нарушают процесс дозревания ВИЧ, что также блокирует размножение вируса.',style: TextStyle(fontStyle: FontStyle.italic)),
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
                    TextSpan(text: 'Долутогравир подавляет фермент интегразу – которая запускает размножение вируса в клете СД-4 человека.  ',style: TextStyle(fontStyle: FontStyle.italic)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В результате применения АРТ, содержание ВИЧ в организме уменьшается в тысячи раз, и он практически перестает размножаться. '
                        'Если ВИЧ не размножается, значит он больше не поражает иммунные клетки. С этого времени иммунная система начинает восстанавливаться.',),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В настоящее время в мире применяется более 20 антиретровирусных препаратов. Каждый препарат действует на один из этапов размножения вируса. '
                        'Поэтому врачи подбирают схему лечения, которая включает несколько препаратов. АРВП, дополняя друг друга, обеспечивают защиту организма от ВИЧ.',),
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
                    TextSpan(text: 'Схема АРТ всегда содержит три разных АРВ-препарата.',),
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
                    TextSpan(text: 'Схему лечения определяет врач, с учетом особенностей здоровья и результатов лабораторного исследования.',),
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
                    TextSpan(text: 'В одной таблетке может содержаться 1, 2, или 3 препарата.',),
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
                    TextSpan(text: 'Ежедневно принимают от одной до трех (иногда до шести) таблеток. Это зависит от состояния иммунитета и устойчивости вируса к препаратам.  ',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Для того, чтобы контролировать лечение, нужно регулярно сдавать кровь на вирусную нагрузку.  ',),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Когда АРТ перестает работать (не снижается вирусная нагрузка)?', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    TextSpan(text: 'Чаще всего это связано с низкой приверженностью к лечению - когда ЛЖВ по разным причинам пропускают прием препаратов. ',),
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
                    TextSpan(text: 'Иногда сам ВИЧ приспосабливается и становится невосприимчивым (устойчивым) к действию лекарств. ',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Такие случаи нужно обсудить с врачом и совместно решать проблему.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Назначение АРВП проводится в строгом соответствии с инструкциями, которые утверждаются Министерством здравоохранения (они называются Клинические протоколы).',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В мире ведется постоянная работа по созданию новых более эффективных лекарств для лечения ВИЧ-инфекции.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Воздействие АРТ на человека с ВИЧ'),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Лечение ВИЧ-инфекции (АРТ) позволяет продлить жизнь, улучшить ее качество, предотвратить развитие СПИДа, снизить '
                        'уровень смертности среди людей с ВИЧ, снизить частоту передачи ВИЧ, а также предотвратить передачу ВИЧ от ВИЧ-позитивной матери ребенку.',),
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
                    TextSpan(text: 'Улучшается качество жизни, то есть заболевания, связанные с ВИЧ (например, длительная диарея, туберкулез, частые ангины, герпес, кожный зуд и другие),'
                        ' не появятся либо будут лучше поддаваться лечению на фоне АРТ.',),
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
                    TextSpan(text: 'Увеличится продолжительность жизни, т. е. продолжительность жизни людей с ВИЧ, получающих АРТ, практически не отличается от таковой у людей без ВИЧ.',),
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
                    TextSpan(text: 'АРТ может снизить риск передачи ВИЧ половому партнеру более, чем на 90 %! То есть помимо индивидуального положительного воздействия на организм '
                        'пациента с ВИЧ, АРТ также помогает улучшить семейные отношения, снизить страх инфицирования ВИЧ партнера. Однако АРТ должна обязательно использоваться с '
                        'комбинации с другими методами профилактики передачи ВИЧ, в том числе с использованием презервативов.',),
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
                    TextSpan(text: 'Прием АРТ позволяет планировать беременность и обеспечивает рождение здорового ребенка у родителей, живущих с ВИЧ.  ',),
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
                    TextSpan(text: 'Улучшаются лабораторные показатели:\n', style: TextStyle(fontWeight: FontWeight.w600)),
                    TextSpan(text: '- снижение вирусной нагрузки до неопределяемого уровня означает, что терапия эффективна, что ВИЧ не размножается и не поражает иммунные клетки;\n\n',),
                    TextSpan(text: '- повышение количества CД4-клеток означает, что иммунная система восстанавливается и серьезные сопутствующие заболевания не разовьются;\n\n',),
                    TextSpan(text: '- возможно улучшение других лабораторных показателей (например, повышение уровня гемоглобина, нормализация печёночных тестов).',),
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
                    TextSpan(text: 'Улучшается настроение, поскольку снимается чувство беспокойства за близких, за возможность передачи ВИЧ половым партнерам, за планирование рождения детей. '
                        'Улучшаются семейные отношения, особенно в тех случаях, когда близкие родственники вовлечены в процесс наблюдения и лечения.\n',),
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
                    TextSpan(text: 'Назначение АРТ у детей обеспечивает их рост и развитие в соответствии с их неинфицированными сверстниками',),
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
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Преимущества от приема АРТ'),
                  ]
              ),
            ),
          ),
          ListTile(),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Несмотря на то, что ВИЧ может долго не проявляет себя в организме человека, он медленно уничтожает иммунные клетки, '
                        'которые защищают организм от болезней. Назначение АРТ позволит сохранить иммунную систему и, таким образом, защитит организм от болезней.\n',),
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
                    TextSpan(text: 'В случае нарушения иммунитета, организм человека с ВИЧ подвергается риску сопутствующих заболеваний, прежде всего, туберкулеза – они '
                        'называются оппортунистические инфекции и не развиваются у людей с сильной иммунной системой. Каждое заболевание само по себе таит серьезную '
                        '(а иногда и смертельную) опасность для человека. Для человека с ВИЧ – это дополнительная угроза снижения иммунитета. Помимо этого, наряду с АРТ '
                        'возникнет необходимость приема других препаратов, что усилит риск нежелательных эффектов от лечения. Т.е. вместо 2-3 препаратов в день придется '
                        'принимать 8-10 препаратов в зависимости от формы туберкулеза.\n',),
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
                    TextSpan(text: 'Риск возникновения и тяжесть течения любых заболеваний у человека с ВИЧ значительно опаснее, чем у людей без ВИЧ-инфекции.\n',),
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
                    TextSpan(text: 'Назначение АРТ ВИЧ-позитивным беременным женщинам позволяет предотвратить передачу ВИЧ ее ребенку.\n',),
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
                    TextSpan(text: 'Важно назначать лечение детям, чтобы они испытали все радости жизни и общения со сверстниками без боли, без болезней, с хорошим физическим развитием и сильной иммунной системой.\n',),
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
                    TextSpan(text: 'Наука не стоит на месте. Проводится работа по разработке новых лекарств для лечения ВИЧ-инфекции. '
                        'Возможно, такие лекарства будут найдены и Вам удастся полностью освободиться от ВИЧ.\n',),
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
                    TextSpan(text: 'Человек рожден, чтобы жить. Для этого люди переносят тяжелые операции, соглашаются на ампутацию ног, рук, груди, '
                        'платят огромные деньги за пересадку сердца и почек, а затем пожизненно принимают специальные препараты; бывает, что жертвуют '
                        'своими органами (почкой) для своих близких. Поэтому прием одной-трех таблеток в день – это минимальная плата за долгую и здоровую жизнь...\n',),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView5(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Что такое вирусная нагрузка (ВН) и число лимфоцитов CД4?'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Image.asset("assets/images/treatment_image3.png"),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Лимфоциты CД4 (или CД4-клетки) – это вид лимфоцитов (клетки-помощники), которые играют важную роль в иммунном ответе организма. \n',),
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
                    TextSpan(text: 'Число лимфоцитов CД4 – это количество лимфоцитов CД4 в одном микролитре крови (клеток/мкл).\n',),
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
                    TextSpan(text: 'В норме количество лимфоцитов CД4 для взрослых без ВИЧ составляет примерно от 500 до 1200/мкл.\n',),
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
                    TextSpan(text: 'Пока число лимфоцитов CД4 превышает 500/мкл, человек находится в безопасности.\n',),
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
                    TextSpan(text: 'При снижении числа лимфоцитов CД4 менее 350/мкл могут начаться проблемы со здоровьем в виде частых простудных заболеваний, '
                        'молочницы (кандидоз полости рта, половых органов), опоясывающего лишая, туберкулеза лёгких и др.\n',),
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
                    TextSpan(text: 'При снижении уровня CД4-клеток менее 200/мкл повышается риск развития опасных для жизни инфекций – пневмоний, сепсиса, токсоплазмоза, которые очень сложно лечить.\n',),
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
                    TextSpan(text: 'На фоне приёма АРТ количество лимфоцитов CД4 увеличивается, однако рост числа клеток у разных пациентов происходит по-разному. '
                        'В среднем можно ожидать повышения числа клеток на 50-100/мкл в год в течение 3-5 лет после начала АРТ. Далее рост замедляется. У пожилых пациентов, '
                        'у пациентов с изначально очень низким числом CД4-клеток рост может быть менее выраженным.\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Вирусная нагрузка (сокращенно – ВН) — это количество копий ВИЧ в 1 миллилитре крови (копий/мл).  \n',),
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
                    TextSpan(text: 'Этот показатель показывает эффективность АРТ. Целью приёма АРТ является снижение ВН до неопределяемого уровня. \n',),
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
                    TextSpan(text: 'В нашей стране неопределяемым считается уровень, когда ВН снизится до 40 копий/мл. Иначе говоря, если на фоне АРТ '
                        'ВН опустился ниже уровня 40 копий/ мл, то аппарат уже не может определить ВИЧ в крови. \n',),
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
                    TextSpan(text: 'Чаще всего ВН становится неопределяемой через 6 месяцев после начала АРТ. Если этого не происходит, то пациенту следует обязательно обсудить с врачом причину данного явления.\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Как часто нужно сдавать анализы на число CД4-клеток и ВН? \n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Эти исследования проводятся при установлении диагноза ВИЧ-инфекции либо при возобновлении АРТ '
                        'после перерыва в лечении. Далее такое обследование рекомендуется проходить не реже 1 раза в 6 месяцев.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Тест на ВН очень важно проводить регулярно 1 раз в 6 месяцев – поскольку он показывает эффективность лечения. При недоступности такого исследования, '
                        'например, если человек длительно находится в миграции в других странах, тест на ВН следует проводить не реже 1 раза в год.',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Если количество СД-4 клеток не ниже 500 клеток в 1 мкл., человек хорошо переносит терапию и не имеет проблем со здоровьем, тест на СД-4 можно не проводить.',),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView6(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'НЕЖЕЛАТЕЛЬНЫЕ (ПОБОЧНЫЕ) ЭФФЕКТЫ АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ.'),
                  ]
              ),
            ),
          ),
//          ListTile(
//            title: Image.asset('assets/images/treatment_image4.png'),
//          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor,),
                  children: [
                    TextSpan(text: 'Лекарственные препараты принимают для специальных целей, например, чтобы избавиться от кашля, подавить размножение вируса. '
                        'Все, что помимо этого делает лекарство – это побочный эффект. Иногда вместо термина',),
                    TextSpan(text: ' «побочный эффект» ', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                    TextSpan(text: 'говорят',),
                    TextSpan(text: ' «побочные, или нежелательные явления». ', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                    TextSpan(text: 'Разработка новых лекарств для лечения ВИЧ-инфекции направлена также на снижение нежелательных эффектов от их применения. \n', style: TextStyle(fontWeight: FontWeight.bold,)),
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
                    TextSpan(text: 'Практически все, лекарства, в том числе антиретровирусные препараты в той или иной степени имеют побочные эффекты. \n',),
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
                    TextSpan(text: 'Нежелательные эффекты антиретровирусных препаратов могут иметь определенные проявления, а иногда только изменениями лабораторных показателей (например, изменения «печеночных тестов»).\n',),
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
                    TextSpan(text: 'Следует помнить, что иногда такие эффекты наблюдаются в силу психологического ожидания таких эффектов. ЛЖВ слышат от своих знакомых на АРТ, что у '
                        'них появляются побочные эффекты и заранее испытывают страх перед терапией, прислушиваются к своим ощущениям. \n',),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Побочные реакции бывают не у каждого пациента.\n',),
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
                    TextSpan(text: 'Нужно понимать, что эти реакции могут проходить по мере принятия препаратов, либо имеются некоторые условия для снижения таких реакций. Например, врач назначает'
                        ' прием препарата до или после еды; прием на ночь и другое – это все направлено на снижение побочных эффектов.\n',),
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
                    TextSpan(text: 'Эффект от приема препаратов значительно выше, чем их негативное воздействие – поэтому в интересах здоровья и жизни следует принять'
                        ' некоторые нежелательные эффекты от лечения и попытаться их преодолеть, советуясь с врачом. ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Обо всех своих нежелательных ощущениях после начала терапии, следует сообщать врачу. Если же побочные явления тяжелые – врач может изменить схему лечения. ')
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
                    TextSpan(text: 'Некоторые побочные эффекты наблюдаются только в первые дни и недели приёма АРТ. Они обычно проходят самостоятельно без какого-либо лечения.')
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Можно ли предотвратить побочные эффекты антиретровирусных препаратов?\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В части случаев врач может снизить риск возникновения побочных эффектов, правильно подобрав схему лечения. Например, если у пациента есть анемия, '
                        'ему не назначают препараты, которые могут её усугубить (например, зидовудин). Другой пример: если у пациента имеется гепатит, ему нежелательно назначать невирапин, '
                        'он таких пациентов может вызвать ухудшение состояния печени.\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'В некоторых случаях побочные эффекты схожи с проявлением других заболеваний. Например, рвота и диарея могут быть связаны не с приёмом АРТ, а с острой кишечной инфекцией.',),
                    TextSpan(text: ' Поэтому пациенту всегда следует сообщать врачу о всех новых симптомах, которые появились после начала АРТ.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
            ),
          ),
        ],
      ).toList(),
    );
  }
  Widget _myListView7(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: ListTile.divideTiles(
        color: Colors.transparent,
        context: context,
        tiles: [
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontWeight: FontWeight.bold, fontSize:  widget.fontSize+3, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'ПРИВЕРЖЕННОСТЬ к АНТИРЕТРОВИРУСНОЙ ТЕРАПИИ'),
                  ]
              ),
            ),
          ),
          ListTile(
            title: Image.asset('assets/images/treatment_image5.png'),
          ),
          ListTile(),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor,),
                  children: [
                    TextSpan(text: 'Приверженность к АРТ означает прием антиретровирусных препаратов пациентом с точным соблюдением графика приема и дозировки, которые были рекомендованы врачом. '
                        'Высокая приверженность АРТ – важнейшее условие успеха лечения. ',),
                    TextSpan(text: 'Для эффективного подавления размножения ВИЧ (то есть до достижения неопределяемой вирусной нагрузки) необходимо принимать ', style: TextStyle(fontWeight: FontWeight.bold,)),
                    TextSpan(text: ' 95 –100 % предписанных доз препаратов. \n', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor),
                  children: [
                    TextSpan(text: 'Люди иногда допускают ошибки в приеме препаратов по невнимательности, забывчивости либо неверия в эффективность лечения. '
                        'Поэтому важно получить правдивую информацию об АРТ и получить поддержку.  Большую помощь Вам могут оказать люди, которые живут с ВИЧ, '
                        'и могут открыто говорить о своем статусе. Можно также принять участие в группах поддержки (группы само и взаимопомощи) из числа ЛЖВ и/или '
                        'сообщества. Они помогут справиться со стрессом, связанным с принятием ВИЧ-статуса; помогут на начальном этапе лечения по ВИЧ-инфекции, '
                        'напомнят о приеме препаратов; окажут другую помощь.\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Почему важно принимать препараты точно по времени?\n',),
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
                    TextSpan(text: 'Для каждого препарата рассчитана такая дозировка и такая частота приёма, чтобы в крови постоянно поддерживалось определённое количество лекарства. Только в '
                        'этом случае ВИЧ не размножается, и не формируются его изменения (мутации), которые могут стать причиной устойчивости к антиретровирусным препаратам'
                        ' – и лечение перестанет действовать на вирус.\n',),
                  ]
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.solidCircle, color: kColorPrimary,),
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor,),
                  children: [
                    TextSpan(text: 'При пропуске препарата количество лекарства в крови снижается, и ВИЧ начинает размножаться. При этом могут образоваться вирусы-мутанты, '
                        'которые обладают устойчивостью к антиретровирусным препаратам. В результате текущая схема АРТ становится неэффективной и возникает необходимость в '
                        'замене схемы лечения, что может сопровождаться увеличением количества принимаемых таблеток. \n',),
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
                    TextSpan(text: 'Чем чаще повторяются пропуски, тем больше шансов, что вирус приспособится и станет устойчивым к антиретровирусным препаратам. \n',),
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
                    TextSpan(text: 'Допустимо отклонятся на один час от предписанного времени приема лекарств в ту или иную сторону, но лучше всего ориентироваться на прием лекарств в '
                        'одни и те же часы - для этого можно использовать оповещение на мобильном телефоне, увязать прием препаратов с обычным ежедневным действием (умыванием, завтраком, '
                        'ежедневным выходом на работу) либо попросить помощи друзей или родственников.\n')
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
                    TextSpan(text: 'При пропуске приема очередной дозы препарата её можно принять только в том случае, если до времени следующего приема осталось'),
                    TextSpan(text: ' более 6 часов ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '(для лекарств, которые принимают два раза в день, например, Комбивир) или ',),
                    TextSpan(text: ' более 12 часов ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '(для лекарств, которые принимают один раз в день, например, Атрипла). \n',),
                  ]
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle( fontSize:  widget.fontSize, color: Theme.of(context).cursorColor, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'Как повысить приверженность\n',),
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
                    TextSpan(text: 'Привязать прием препаратов к повседневным делам (например, к чистке зубов).\n',),
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
                    TextSpan(text: 'Напоминающие приспособления (таймеры сотовых телефонов).',),
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
                    TextSpan(text: 'Записать рекомендации врача и следовать им.',),
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
                    TextSpan(text: 'Составить календарь посещения врача с учетом возможных выходных и праздничных дней, чтобы получать препараты заранее до их полного использования.',),
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
                    TextSpan(text: 'Использовать контейнеры для таблеток или аптечки-органайзеры.',),
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
                    TextSpan(text: 'Общение пациента с равными себе людьми, которые оказывают моральную поддержку и практическую помощь,',),
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
                    TextSpan(text: 'Найти компаньона по лечению – человека, который будет вместе с пациентом и возьмёт на себя бремя помощи (родственник,'
                        ' друг или патронажная медсестра, хотя бы на начальном этапе лечения).',),
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
                    TextSpan(text: 'Включение в программы заместительной терапии метадоном для ЛЖВ, которые принимают наркотики.',),
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
    else if(type ==5){
      return _myListView5(context);
    }
    else if(type ==6){
      return _myListView6(context);
    }
    else if(type ==7){
      return _myListView7(context);
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
              Text(widget.title, softWrap: true,),
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