import 'package:flutter/material.dart';

class CustomEditProductQuantityRow extends StatelessWidget {
  const CustomEditProductQuantityRow({
    super.key,
    required this.text,
    this.firstController,
    this.firstValidator,
    this.sectController,
    this.secValidator,
  });
  final String text;
  final TextEditingController? firstController;
  final String? Function(String?)? firstValidator;
  final TextEditingController? sectController;
  final String? Function(String?)? secValidator;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width: 110,
            child: TextFormField(
              validator: firstValidator,
              controller: firstController,
              minLines: 1,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
              ),
            )),
        SizedBox(
            width: 110,
            child: TextFormField(
              minLines: 1,
              validator: secValidator,
              controller: sectController,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.grey,
                )),
                // border: OutlineInputBorder()
              ),
            )),
      ],
    );
  }
}
