import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_road_widgets/days/Day1.dart';
import 'package:flutter_road_widgets/days/Day2.dart';

void main() => runApp(new IndexPage());

class IndexPage extends StatelessWidget {
  Widget menuIcons (BuildContext context, Icon icon,String title, Widget nextPage) {
    return Container(
        decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: const BorderSide(color: const Color(0xFFCCCCCC)),
              end: const BorderSide(color: const Color(0xFFCCCCCC)),
            )
        ),
        child: InkWell(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute<bool>(
                builder: (BuildContext context) => nextPage,
              ),);
            },
            child: Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon,
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child:  Text(
                            title,style: TextStyle(fontSize: 16)
                        )
                    )
                  ],
                )
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('Flutter Learning Road'),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 3,
        children: <Widget>[
          menuIcons(context, Icon(FontAwesomeIcons.font, size: 50.0, color: Color(0xFFc94a53)), 'Text' ,Day1()),
          menuIcons(context, Icon(FontAwesomeIcons.toggleOff, size: 50.0, color: Color(0xFFe16552)), 'Button' ,Day2()),
          menuIcons(context, Icon(FontAwesomeIcons.image, size: 50.0, color: Color(0xFFf19670)), 'Image' ,Day1()),
          menuIcons(context, Icon(FontAwesomeIcons.thList, size: 50.0, color: Color(0xFFe2975d)), 'ListView' ,Day1()),
          menuIcons(context, Icon(FontAwesomeIcons.thLarge, size: 50.0, color: Color(0xFFe9d78e)), 'GridView' ,Day1()),
          menuIcons(context, Icon(FontAwesomeIcons.clone, size: 50.0, color: Color(0xFFe4bf80)), 'Dialog' ,Day1()),
//          menuIcons(context, Icon(FontAwesomeIcons.cloudSunRain, size: 50.0, color: Color(0xFF90BDC1)), 'Day2' ,Day2()),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}