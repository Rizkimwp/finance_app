class Transaction {
  final int? id;
  final String description;
  final int amount;
  final String date;
  final String type; // 'income' atau 'expense'

  Transaction({
    this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date,
      'type': type,
    };
  }

  static Transaction fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      date: map['date'],
      type: map['type'],
    );
  }
}
