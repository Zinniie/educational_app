import 'package:education_app/constants/color.dart';
import 'package:education_app/models/course.dart';
import 'package:education_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CourseContainer extends StatelessWidget {
  const CourseContainer({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    title: course.name,
                  ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                ),
                Text(
                  'Author ${course.author}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 5,
                ),
                LinearProgressIndicator(
                  value: course.completedPercentage,
                  backgroundColor: Colors.black12,
                  color: kPrimaryColor,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
