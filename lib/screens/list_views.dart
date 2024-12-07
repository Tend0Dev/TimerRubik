import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_rubik/providers/scramble_providers.dart';
import 'package:timer_rubik/providers/times_providers.dart';
import 'package:timer_rubik/widgets/times_card.dart';

class ListViews extends StatefulWidget {
  const ListViews({super.key});

  @override
  State<ListViews> createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = '${today.day}/${today.month}';
    final times = Provider.of<TimesProvider>(context).times;
    final scrambles = Provider.of<ScrambleProvider>(context).scrambles;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: times.length,
      itemBuilder: (context, index) {
        final record = times[index];
        final recordScrambles = scrambles[index];
        return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: TimesCard(
                  formattedDate: formattedDate,
                  recordScrambles: recordScrambles,
                  record: record),
            ));
      },
    );
  }
}
