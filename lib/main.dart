import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatelessWidget {
  TextEditingController _sellPriceCtrl = TextEditingController();
  TextEditingController _credAmountCtrl = TextEditingController();
  TextEditingController _firstFondCtrl = TextEditingController();
  TextEditingController _creditMonthCountCtrl = TextEditingController();
  TextEditingController _everyMonthFondCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'My home page',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
          child:
              ListView(padding: const EdgeInsets.all(20), children: const [])),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('Sell price'),
              prefixIcon: Icon(
                Icons.price_change,
              ),
            ),
            controller: _sellPriceCtrl,
            onChanged: (val) {
              final parsedNum = double.parse(val);
              final creditAmount = (parsedNum + (parsedNum / 100 * 30));
              _credAmountCtrl.text = creditAmount.toString();
              _firstFondCtrl.text = (creditAmount / 100 * 30).toString();
            },
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.number,
            readOnly: true,
            decoration: InputDecoration(
              label: Text('Credit amount'),
              prefixIcon: Icon(
                Icons.price_change,
              ),
            ),
            controller: _credAmountCtrl,
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('First fond'),
              prefixIcon: Icon(
                Icons.price_change,
              ),
            ),
            controller: _firstFondCtrl,
            onChanged: (val) {
              final firstFound = double.parse(val);
              final monthCount = double.parse(_creditMonthCountCtrl.text);
              final ostatok = double.parse(_credAmountCtrl.text) - firstFound;
              if (monthCount <= 0) {
                _everyMonthFondCtrl.text = '';
                return;
              }
              _everyMonthFondCtrl.text = '${ostatok / monthCount}';
            },
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              label: Text('Credit month count'),
              prefixIcon: Icon(
                Icons.price_change,
              ),
            ),
            controller: _creditMonthCountCtrl,
            onChanged: (val) {
              final monthCount = double.parse(val);
              final ostatok = double.parse(_credAmountCtrl.text) -
                  double.parse(_firstFondCtrl.text);
              if (monthCount <= 0) {
                _everyMonthFondCtrl.text = '';
                return;
              }
              _everyMonthFondCtrl.text = '${ostatok / monthCount}';
            },
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              label: Text('Every month fond'),
              prefixIcon: Icon(
                Icons.price_change,
              ),
            ),
            controller: _everyMonthFondCtrl,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('the button is pressed'),
      ),
    );
  }
}
