import 'package:currency_flutter/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../components/achatMilesSettings.dart';
import '../functions/fetchrates.dart';
import '../model/miles.dart';
import '../model/ratesmodel.dart';

class AchatMiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selected = 0;
  double price = 0;
  late Miles miles;
  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Color(0xFFD80404),
        title: Container(
          padding: EdgeInsets.all(25),
          child: Image.asset(
            "assets/images/tunisair.png",
            height: 60,
          ),
        ),
        elevation: 0.0,
      ),
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text("Achat des Miles",
              style: TextStyle(fontSize: 25, fontFamily: 'ElMessiri')),
        ),
        SingleChildScrollView(
          child: Form(
            key: formkey,
            child: FutureBuilder<RatesModel>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: FutureBuilder<Map>(
                      future: allcurrencies,
                      builder: (context, currSnapshot) {
                        if (currSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AchatMilesSettings(
                              currencies: currSnapshot.data!,
                              rates: snapshot.data!.rates,
                            ),
                          ],
                        );
                      }),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 19)),
                child: Text("Acheter"),
                onPressed: () {})
          ],
        ))
      ],
    ));
  }
}
