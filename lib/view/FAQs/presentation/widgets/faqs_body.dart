import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/loading_indicator.dart';
import '../bloc/faqs_cubit.dart';
import 'faqs_card.dart';

class FAQsViewBody extends StatelessWidget {
  const FAQsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqsCubit, FaqsState>(
      builder: (context, state) {
        final cubit = FaqsCubit.of(context);
        return state is FaqsLoading
            ? const LoadingIndicator()
            : ListView.builder(
                itemCount: cubit.listOfFAQsData.length,
                itemBuilder: (context, index) {
                  return FAQsCard(
                    title: cubit.listOfFAQsData[index].question!,
                    desc: cubit.listOfFAQsData[index].answer!,
                  );
                },
              );
      },
    );
  }
}
