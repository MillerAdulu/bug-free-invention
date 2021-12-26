import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:holidays/features/create_holiday/cubit/create_holiday_cubit.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 16),
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
                child: BlocConsumer<CreateHolidayCubit, CreateHolidayState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loading: () {},
                      loaded: (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Holiday created successfully"),
                          ),
                        );

                        Navigator.of(context).pop();
                      },
                      error: (message) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      ),
                    );
                  },
                  builder: (context, state) {
                    return SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: GFButton(
                        child: state.when(
                          initial: () => Text('Create Now'),
                          loading: () => Text('Loading ...'),
                          loaded: (_) => Text('Create Now'),
                          error: (_) => Text('Create Now'),
                        ),
                        onPressed: () =>
                            context.read<CreateHolidayCubit>().createHoliday(
                                  name: _nameController.text,
                                  date: _selectedDate.toString(),
                                ),
                      ),
                    );
                  },
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
