import 'package:flutter/material.dart';

class DataEntryScreen extends StatefulWidget {
  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  DateTime? selectedDate;
  String? selectedMaterialType;
  String? selectedSellerName;
  String? selectedBatchCode;
  String? address;
  String? selectedCropHs;
  String? selectedOriginHs;
  String? selectedCoA;
  String? selectedCoB;

  List<String> materialTypes = ['Type 1', 'Type 2', 'Type 3'];
  List<String> sellerNames = ['Seller 1', 'Seller 2', 'Seller 3'];
  List<String> batchCodes = ['Batch 1', 'Batch 2', 'Batch 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giám sát tiếp nhận nguyên liệu'),
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
                          child: Text('Họ tên người bán'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedMaterialType,
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
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
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
                          child: Text('Loại nguyên liệu'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedSellerName,
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
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
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
                          child: Text('Địa chỉ'),
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
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Text('Hồ sơ cam kết xuất xứ'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedCropHs,
                          items: ['Có', 'Không'].map((hs) {
                            return DropdownMenuItem<String>(
                              value: hs,
                              child: Text(hs),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCropHs = value;
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
                          child: Text('Hồ sơ trồng trọt'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedOriginHs,
                          items: ['Có', 'Không'].map((hs) {
                            return DropdownMenuItem<String>(
                              value: hs,
                              child: Text(hs),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedOriginHs = value;
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
                          child: Text('Chứng nhận CoA'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedCoA,
                          items: ['Có', 'Không'].map((hs) {
                            return DropdownMenuItem<String>(
                              value: hs,
                              child: Text(hs),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCoA = value;
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
                          child: Text('Kiểm tra nguồn gốc lô'),
                        ),
                      ),
                      TableCell(
                        child: DropdownButtonFormField<String>(
                          value: selectedCoB,
                          items: ['Jesmean190200', 'St250500'].map((hs) {
                            return DropdownMenuItem<String>(
                              value: hs,
                              child: Text(hs),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCoB = value;
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
                ],
              ),
            ),
            SizedBox(
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
