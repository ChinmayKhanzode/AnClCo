import 'package:flutter/material.dart';

class QuantityChange extends StatefulWidget {
  const QuantityChange(
      {super.key, required this.setQuan, required this.initialQuantity});
  final void Function(int quan) setQuan;
  final int initialQuantity;

  @override
  State<QuantityChange> createState() => _QuantityChangeState();
}

class _QuantityChangeState extends State<QuantityChange> {
  int _quantity = 1;
  @override
  void initState() {
    _quantity = widget.initialQuantity;
    print(widget.initialQuantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _ChangeQuantity(String value) {
      if (value == "+") {
        if (_quantity < 6) {
          setState(() {
            _quantity++;
          });
          widget.setQuan(_quantity);
        }
        return;
      } else {
        if (_quantity > 0) {
          setState(() {
            _quantity--;
          });
          widget.setQuan(_quantity);
        }
        return;
      }
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                _ChangeQuantity("+");
              },
              child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  height: 25,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 122, 60),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Text("+",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            Container(
              alignment: Alignment.center,
              width: 18,
              child: Text("$_quantity",
                  style: const TextStyle(color: Colors.black87, fontSize: 16)),
            ),
            GestureDetector(
              onTap: () {
                _ChangeQuantity("-");
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 4),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 122, 60),
                      borderRadius: BorderRadius.circular(9)),
                  child: const Text(
                    "-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
