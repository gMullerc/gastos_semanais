import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transaction,
    required this.onRemove,
  }) : super(key: key);
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'Nenhuma transacao cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (context, index) {
              final tr = transaction[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('R\$ ${tr.value}')),
                      ),
                    ),
                    title: Text(tr.title,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    subtitle: Text(DateFormat('dd/MM/yyyy').format(tr.date)),
                    trailing: MediaQuery.of(context).size.width > 480
                        ? TextButton.icon(
                            onPressed: () => onRemove(tr.id),
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor),
                            label: Text(
                              'Excluir',
                            ),
                          )
                        : IconButton(
                            onPressed: () => onRemove(tr.id),
                            color: Theme.of(context).errorColor,
                            icon: Icon(Icons.delete),
                          )),
              );
            },
          );
  }
}
