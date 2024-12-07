import 'package:flutter/material.dart';

class CardAlgorithms extends StatelessWidget {
  final String title;
  final String image;
  final String scramble;

  const CardAlgorithms({
    super.key,
    required this.title,
    required this.image,
    required this.scramble,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.black26,
            ),
            image.startsWith('http') || image.startsWith('https')
                ? Image.network(
                    image,
                    height: 100,
                    width: 150,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, size: 100);
                    },
                  )
                : Image.asset(
                    image,
                    height: 100,
                    width: 150,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, size: 100);
                    },
                  ),
            const Divider(
              color: Colors.black26,
            ),
            Text(
              scramble,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
