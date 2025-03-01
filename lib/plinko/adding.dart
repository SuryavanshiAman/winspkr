import 'package:flutter/material.dart';


class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int selectedIndex = 10;
  TextEditingController amount = TextEditingController();
  int initValue = 10;

  @override
  void initState() {
    super.initState();
    amount.text = selectedIndex.toString();
  }

  void incrementCounter() {
    setState(() {
      selectedIndex += initValue;
      amount.text = selectedIndex.toString();
    });
  }

  void decrementCounter() {
    setState(() {
      if (selectedIndex >= initValue) {
        selectedIndex -= initValue;
        amount.text = selectedIndex.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: decrementCounter,
            child: Container(
              margin: EdgeInsets.zero,
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.remove,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: TextField(
              controller: amount,
              readOnly: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
          InkWell(
            onTap: incrementCounter,
            child: Container(
              margin: EdgeInsets.zero,
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '+',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }
}
