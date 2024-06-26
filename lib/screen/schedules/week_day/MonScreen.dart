import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/schedules_cubit.dart';
import '../widget/build_list_subject.dart';

class MonScreen extends StatelessWidget {
  const MonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchedulesCubit, SchedulesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = SchedulesCubit.get(context);
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.58,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return BuildListOfSubject(
                    Item: cubit.itemModels[index],
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
