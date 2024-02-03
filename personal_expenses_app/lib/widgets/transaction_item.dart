import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
                child: Text('৳${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                style: IconButton.styleFrom(
                    foregroundColor:
                        const Color.fromRGBO(202, 11, 4, 0.821)),
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  // color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  // style: TextStyle(
                  //   color: Colors.red,
                  // ),
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
