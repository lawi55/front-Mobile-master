import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentMiles extends StatefulWidget {
  const PaymentMiles({Key? key}) : super(key: key);

  @override
  State<PaymentMiles> createState() => _PaymentMilesState();
}

class _PaymentMilesState extends State<PaymentMiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Vous allez payer"),
          ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 19)),
                child: Text("Paiement réussi"),
                onPressed: () {}),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 40),
                    textStyle: TextStyle(fontSize: 19)),
                child: Text("Paiement échoué"),
                onPressed: () {})

        ],
      ),
    );
    
  }
}