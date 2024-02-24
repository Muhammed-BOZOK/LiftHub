import 'package:flutter/material.dart';
import 'package:solution_challenge/constants/app_color.dart';
import 'package:solution_challenge/constants/text_style.dart';
import 'package:solution_challenge/view/edit_profile_screen.dart';
import 'package:solution_challenge/widgets/custom_elevatedbutton_widget.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });
  final String userName = 'USER NAME';

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.green,
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(
                  5,
                ),
                width: 120,
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        child: Text(
                          userName,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomElevatedButton(
                        onTop: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const EditProfileScrren();
                              },
                            ),
                          );
                        },
                        btnTitle: 'Edit Profile',
                        btnHeight: 20,
                        btnWidth: 50,
                        btnColor: btnBlueColor,
                        btnTextStyle: drawerHeaderBtnStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
