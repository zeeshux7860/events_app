import 'package:firexcode/firexcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home().xMaterialApp();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController eName = TextEditingController();
  TextEditingController eDate = TextEditingController();
  List<Map<String, String>> listData = [];
  @override
  Widget build(BuildContext context) {
    xStatusBar(statusBarColor: Colors.white);
    return xListView.list([
      //"Your Events".xH1Text(color: Colors.black).xap(value: 20),
      xColumn
          .list([
            "Event Name".xTF(controller: eName),
            "Event Date".xTF(controller: eDate)
          ])
          .xap(value: 5)
          .xCard(elevation: 0.1, borderRadius: BorderRadius.circular(10))
          .xap(value: 10),
      "Add Event"
          .xTextColorWhite()
          .xFlatButton(
              padding: EdgeInsets.all(15),
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  listData.add({'e_name': eName.text, 'e_date': eDate.text});
                });
                eName.clear();
                eDate.clear();
                print(listData);
              })
          .xhp(value: 10),

      "List Events".xTextColorBlack(fontsize: 15).xap(value: 10),
      (BuildContext context, int index) {
        return ListTile(
          leading: index
              .toString()
              .xTextColorWhite()
              .xCircleAvatar(backgroundColor: Colors.black),
          title: listData[index]['e_name'].text(),
          subtitle: listData[index]['e_date'].text(),
          trailing: "Remove".xTextColorWhite(fontsize: 12).xContainer(
              onTap: () {
                setState(() {
                  listData.removeAt(index);
                });
              },
              padding: EdgeInsets.all(5),
              color: Colors.red,
              rounded: 5),
        );
      }.xListVBCSP(itemCount: listData.length)
    ]).xScaffold(
        appBar: "Your Events".xTextColorBlack().xAppBar(
            elevation: 0.2, backgroundColor: Colors.white, centerTitle: true));
  }
}
