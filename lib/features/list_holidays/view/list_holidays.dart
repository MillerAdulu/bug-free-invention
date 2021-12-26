import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:holidays/features/list_holidays/cubit/list_holidays_cubit.dart';
import 'package:intl/intl.dart';

class ListHolidayPage extends StatefulWidget {
  const ListHolidayPage({Key? key}) : super(key: key);

  @override
  State<ListHolidayPage> createState() => _ListHolidayPageState();
}

class _ListHolidayPageState extends State<ListHolidayPage> {
  @override
  void initState() {
    super.initState();

    context.read<ListHolidaysCubit>().listHolidays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        title: Text("All Holidays"),
      ),
      body: BlocBuilder<ListHolidaysCubit, ListHolidaysState>(
        builder: (context, state) {
          return state.when(
            initial: () => GFLoader(
              type: GFLoaderType.circle,
            ),
            loading: () => GFLoader(
              type: GFLoaderType.circle,
            ),
            loaded: (holidays) => holidays.isEmpty
                ? Center(child: Text('No holidays. Tap + to add one'))
                : ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(holidays[index].name),
                      subtitle: Text(holidays[index].date),
                      trailing: Text(
                        DateFormat.yMEd().format(
                          DateTime.parse(holidays[index].createdAt)
                        )
                      ),
                      
                    ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: holidays.length,
                  ),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
