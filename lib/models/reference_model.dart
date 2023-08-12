




class OrderModel {
  int id;
  dynamic merchantOrderId;

  OrderModel({
    required this.id,
    this.merchantOrderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    merchantOrderId: json["merchant_order_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "merchant_order_id": merchantOrderId,
  };
}
