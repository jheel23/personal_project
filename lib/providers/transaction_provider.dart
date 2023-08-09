import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/models/transaction.dart';

class TransactionProvider extends StateNotifier<List<TransactionModal>> {
  TransactionProvider() : super([]);
  void addTransaction(TransactionModal addtransaction) {
    state = [...state, addtransaction];
  }

  void deleteTransaction(TransactionModal deletetransaction) {
    state = state
        .where((oneTransation) => oneTransation.id != deletetransaction.id)
        .toList();
  }
}
