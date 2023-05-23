import 'package:flutter/material.dart';

class GsNhapLoUpdatePage extends StatefulWidget {
  @override
  _GsNhapLoUpdatePageState createState() => _GsNhapLoUpdatePageState();
}

class _GsNhapLoUpdatePageState extends State<GsNhapLoUpdatePage> {
  DateTime? selectedDate;
  String? selectedMaterialType;
  String? selectedSellerName;
  String? selectedBatchCode;
  String? address;
  String? selectedCropHs;
  String? selectedOriginHs;
  String? selectedCoA;
  String? selectedCoB;

  List<String> materialTypes = ['ST25', 'LT260300', 'St23702'];
  List<String> sellerNames = ['ST25', 'LT260300', 'St23702', 'DT23702'];
  List<String> batchCodes = ['Batch 1', 'Batch 2', 'Batch 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giám sát nhập lô'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 50, 20, 50),
        child: Column(
          children: [
            Container(color: Colors.lightGreenAccent,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                columnWidths: const {
                  0: FlexColumnWidth(1.0),
                  1: FlexColumnWidth(1.0),
                },
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Ngày'),
                        ),
                      ),
                      TableCell(
                        child: InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                            child: Text(
                              selectedDate != null
                                  ? selectedDate.toString()
                                  : 'Chọn ngày',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Thời điểm kiểm tra'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('msl nguyên liệu 1'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          // value: selectedMaterialType,
                          items: materialTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedMaterialType = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Khối lượng:'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('msl nguyên liệu 2'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          // value: selectedMaterialType,
                          items: materialTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedMaterialType = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Khối lượng:'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('msl nguyên liệu 3'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          // value: selectedSellerName,
                          items: sellerNames.map((name) {
                            return DropdownMenuItem<String>(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSellerName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Khối lượng:'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('msl thành phẩm '),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          // value: selectedSellerName,
                          items: sellerNames.map((name) {
                            return DropdownMenuItem<String>(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedSellerName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Khối lượng:'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Nơi bảo quản:'),
                        ),
                      ),
                      TableCell(
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tạo mới"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Cập nhật"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Xoá"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
// Lưu dữ liệu hoặc thực hiện các hành động khác
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
