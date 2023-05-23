class ProductModel {
  ProductModel({
    required this.sanphamId,
    required this.loaisanphamId,
    required this.tensanpham,
  });

  int sanphamId;
  int loaisanphamId;
  String tensanpham;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sanphamId: json["sanpham_id"],
        loaisanphamId: int.tryParse(json["loaisanpham_id"].toString()) ?? 0,
        tensanpham: json["tensanpham"],
      );

  Map<String, dynamic> toJson() => {
        "sanpham_id": sanphamId,
        "loaisanpham_id": loaisanphamId,
        "tensanpham": tensanpham,
      };
}
