import 'package:education_app/models/course.dart';
import 'package:education_app/widgets/course_container.dart';
import 'package:education_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Development',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        child: CustomIconButton(
                            child: Icon(Icons.arrow_back),
                            height: 35,
                            width: 35,
                            onTap: () => Navigator.pop(context)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return CourseContainer(
                      course: courses[index],
                    );
                  },
                  separatorBuilder: (context, _) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: courses.length,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
