import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  final String id;
  const AdviceField({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.onPrimary),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListTile(
              leading: const Text('Icon'),
              title: Text(id),
              trailing: const Text('Nr. 4'),
              tileColor: Colors.red,
            )),
      ),
    );
  }
}
