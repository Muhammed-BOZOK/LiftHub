import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/general_constants.dart';
import 'package:solution_challenge/constants/text_style.dart';
import 'package:solution_challenge/models/video_filter_odel.dart';
import 'package:solution_challenge/widgets/custom_button_widget.dart';
import 'package:solution_challenge/widgets/custom_elevatedbutton_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, this.deviceWidth});

  final double? deviceWidth;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<VideoFilterModel> _typeList = [
    VideoFilterModel(title: 'All'),
    VideoFilterModel(title: 'Gender Discrimination'),
    VideoFilterModel(title: 'Gender Equality'),
  ];
  final String _btnTitle = 'Apply';
  String filterOption = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          children: [
            getFilterOptions(_typeList),
            const Spacer(),
            CustomElevatedButton(
              onTop: () {
                Navigator.pop(context, filterOption);
                debugPrint(filterOption);
              },
              btnHeight: 55,
              btnTitle: _btnTitle,
            )
          ],
        ),
      ),
    );
  }

  void controller(List<bool> list) {
    list.map((e) => false);
  }

  Widget getFilterOptions(
    List<VideoFilterModel> list,
  ) {
    return Column(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return CustomButtonWidget(
              onTap: () {
                filterOption = list[index].title!;
                debugPrint(filterOption);
                setState(() {
                  
                });
              },
              verticalMargin: 5,
              btnChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index].title as String,
                    style: customBtnTextStyle,
                  ),
                  Icon(
                    list[index].isActive == false
                        ? Icons.check_box_outline_blank_rounded
                        : Icons.check_box_outlined,
                    size: 30,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
