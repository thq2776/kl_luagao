class ProductCategoryModel {
  ProductCategoryModel({
    required this.loaisanphamId,
    required this.tenloai,
    required this.mota,
  });

  int loaisanphamId;
  String tenloai;
  String mota;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        loaisanphamId: json["loaisanpham_id"],
        tenloai: json["tenloai"],
        mota: json["mota"],
      );

  Map<String, dynamic> toJson() => {
        "loaisanpham_id": loaisanphamId,
        "tenloai": tenloai,
        "mota": mota,
      };
}
