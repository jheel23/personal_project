import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: deviceSize.height * 0.3,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: const Card(
            elevation: 5,
            child: Center(child: Text('Chart')),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: ValueKey(index),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                        child: Text('\$${index + 1}'),
                      ),
                    ),
                  ),
                  title: const Text('Transaction'),
                  subtitle: const Text('Date'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
