class deposit_history {
  String? id;
  String? userId;
  String? amount;
  String? status;
  String? date;
  String? time;
  String? type;
  String? remark;
  deposit_history({
    required this.id,
    required this.userId,
    required this.amount,
    required this.status,
    required this.date,
    required this.time,
    required this.type,
    required this.remark,
  });
  factory deposit_history.fromJson(Map<String, dynamic> json) {
    return deposit_history(
      id: json["id"],
      userId: json["user_id"],
      amount: json["amount"],
      status: json["status"],
      date: json["date"],
      time: json["time"],
      type: json["type"],
      remark: json["remark"],
    );
  }


}