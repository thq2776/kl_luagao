import 'package:flutter/material.dart';
import 'package:warehouse/testapi/testapi.dart';
import 'package:warehouse/testapi/testapi_model.dart';

class TestApiPage extends StatefulWidget {
   TestApiPage({Key? key, required this.testapi}) : super(key: key);


   final TestApiModel testapi;//1
  @override
  _TestApiPageState createState() => _TestApiPageState();
}

class _TestApiPageState extends State<TestApiPage> {
  TextEditingController kieuIntRowController = TextEditingController();
  TextEditingController secondRowController = TextEditingController();

  Future<bool>? _updateTestapi;//
  Future<bool?>? _deleteTestapi;//

  Future<List<TestApiModel>>? _getTestapiListFuture;//
  final TestApiApi _testApiApi = TestApiApi();//

  String? kieuIntInputError;
  String? secondIdInputError;//ktra rỗng

   @override
  void initState() {
    super.initState();

kieuIntRowController.text=widget.testapi.kieuInt.toString();
    // loaisanphamInPutController.text = widget.masolo.loaisanphamId.toString();
    // trangthaiInPutController.text = widget.masolo.trangthai.toString();
    // tenInPutController.text = widget.masolo.ten;
    // masoloInPutController.text = widget.masolo.masolo;
    // motaInPutController.text = widget.masolo.mota;
    // selectedCategoryId = widget.masolo.loaisanphamId;

// Trạng thái hiển thị

    getTestApiList();
  }

  getTestApiList() {
    setState(() {
      _getTestapiListFuture = _testApiApi.list();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test API Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: kieuIntRowController,
              decoration: InputDecoration(
                labelText: "Số nguyên",
                errorText: kieuIntInputError,
              ),
            ),
            // const SizedBox(height: 16),
            // TextFormField(
            //   controller: kieuIntInputController,
            //   decoration: InputDecoration(
            //     labelText: "Mô tả",
            //     errorText: descriptionInputError,
            //   ),
            // ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: update,
                    child: const Text("Cập nhật"),
                  ),
                ),
                const SizedBox(width: 16),
                // Expanded(
                //   child: ElevatedButton(
                //     onPressed: delete,
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red,
                //     ),
                //     child: const Text("Xoá"),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
void update() {
    // Kiểm tra giá trị đầu vào
  

   _updateTestapi = _testApiApi.update(
              id: widget.testapi.id,
              kieuInt: widget.testapi.kieuInt,
             
            );

            // _updateTestapi?.then((value) {
            //   if (value != null) {
            //     Navigator.of(context).pop(true);
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text(
            //           'Cập nhật danh mục sản phẩm thành công',
            //         ),
            //       ),
            //     );
            //   }
            // });
  }

}
