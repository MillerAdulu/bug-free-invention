import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CreateHolidayPage extends StatefulWidget {
  const CreateHolidayPage({Key? key}) : super(key: key);

  @override
  State<CreateHolidayPage> createState() => _CreateHolidayPageState();
}

class _CreateHolidayPageState extends State<CreateHolidayPage> {
  final _nameController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        title: Text("Create Holiday"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text('Holiday name'),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Text('Holiday date (Tap to set)'),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: GFButton(
                    
                    child: Text('Create Now'),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}
