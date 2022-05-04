import 'package:flutter/material.dart';
import 'form_model.dart';
class FormPage extends StatelessWidget {
  FormPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _amountCtrl = TextEditingController();
  MatHang m = MatHang('', '', 0);
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => m.name = value,
                controller: _nameCtrl,
                validator: (value) => ValidateString(value),
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              DropdownButtonFormField<String>(
                onSaved: (newValue) => m.loaiMH = newValue,
                onChanged: (value) => dropdownValue = value,
                value: dropdownValue,
                validator: (value) => ValidateString(value),
                decoration: const InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)
                        )
                    )
                ),
                items: loaiMHs.map((loaimh) => DropdownMenuItem<String>(
                  child: Text('${loaimh}'),
                  value: loaimh,
                )).toList(),

              ),
              Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                onSaved: (value) => m.soLuong = int.parse(value!),
                validator: (value) => ValidateSoluong(value),
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                    _save(context);
                  },
                      child: Text('Save'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context) {
    if(formState.currentState!.validate())
      formState.currentState!.save();
    HienthiDialog(context);


  }

  ValidateString(String? value) {
    return value == null || value.isEmpty ? "Bạn chưa nhập dữ liệu": null;
  }

  ValidateSoluong(String? value) {
    if(value == null || value.isEmpty)
      return "Bạn chưa nhập dữ liệu";
    else
      return int.parse(value)< 0 ? "Số lượng không bé hơn 0": null;
  }

  void HienthiDialog(BuildContext context) {
    var dialog = AlertDialog(
      title: Text('Thông báo'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Name: ${m.name}'),
          Text('Type: ${m.loaiMH}'),
          Text('Amount: ${m.soLuong}'),
        ],
      ),

      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            child: Text("Ok")
        )
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }
}