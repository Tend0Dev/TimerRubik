import 'package:flutter/material.dart';

class TimesCard extends StatelessWidget {
  const TimesCard({
    super.key,
    required this.formattedDate,
    required this.recordScrambles,
    required this.record,
  });

  final String formattedDate;
  final Map<String, dynamic> recordScrambles;
  final Map<String, dynamic> record;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 7),
        child: Text(
          'Date: $formattedDate',
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.left,
        ),
      ),
      const Divider(
        color: Colors.black26,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 7, right: 7),
        child: Text(
          ' ${recordScrambles['scramble']}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      const Divider(
        color: Colors.black26,
      ),
      Text(
        'Time: ${record['time']}',
        style: const TextStyle(fontSize: 16),
      ),
    ]);
  }
}
