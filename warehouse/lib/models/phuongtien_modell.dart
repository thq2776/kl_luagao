class PhuongTienModel {
  PhuongTienModel({
    required this.phuongtienId,
    required this.tenphuongtien,
    required this.sophuongtien,
    required this.tinhtrangvesinh,
    required this.baoquansanpham,
    required this.taitrong,
  });

  int phuongtienId;
  String tenphuongtien;
  String sophuongtien;
  String tinhtrangvesinh;
  String baoquansanpham;
  String taitrong;

  factory PhuongTienModel.fromJson(Map<String, dynamic> json) =>
      PhuongTienModel(
        phuongtienId: json["phuongtien_id"],
        tenphuongtien: json["tenphuongtien"],
        sophuongtien: json["sophuongtien"],
        tinhtrangvesinh: json["tinhtrangvesinh"],
        baoquansanpham: json["baoquansanpham"],
        taitrong: json["taitrong"],
      );

  Map<String, dynamic> toJson() => {
        "phuongtien_id": phuongtienId,
        "tenphuongtien": tenphuongtien,
        "sophuongtien": sophuongtien,
        "tinhtrangvesinh": tinhtrangvesinh,
        "baoquansanpham": baoquansanpham,
        "taitrong": taitrong,
      };
}
