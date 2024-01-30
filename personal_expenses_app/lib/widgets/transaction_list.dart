import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  const TransactionList(
    this.transaction,
    this.deleteTx, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet !',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 15,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           '${transaction[index].amount.toStringAsFixed(2)} TK',
                //           // tx.amount.toString(),
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 15,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transaction[index].title,
                //             style: Theme.of(context).textTheme.titleMedium,
                //           ),
                //           Text(
                //             DateFormat.yMMMMEEEEd()
                //                 .format(transaction[index].date),
                //             // tx.date.toString(),
                //             style: const TextStyle(
                //               color: Colors.grey,
                //               fontSize: 12,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: FittedBox(
                            child: Text('${transaction[index].amount} TK')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
              // children: transaction.map((tx) {}).toList(),
            ),
    );
  }
}
