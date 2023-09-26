import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/fontSize.dart';

Widget castingcallCard(
    {BuildContext? context,
    String? author,
    List<String>? roles,
    String? title,
    String? type,
    String? imageUrl,
    String? language,
    bool? isBookmarked}) {
  final width = MediaQuery.of(context!).size.width;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 4),
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            section1(author!),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3(roles!, title!, width, isBookmarked!),
            sizedBoxH10(),
            section4(type!, language!)
          ],
        ),
      ),
    ),
  );
}

Widget section1(String author) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        author,
        style: const TextStyle(color: shade2, fontSize: fontSize5),
      ),
      const Text(
        '1 Day ago',
        style: TextStyle(color: shade2, fontSize: fontSize6),
      )
    ],
  );
}

Widget section2(double width, String? imageUrl) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://cdn.pixabay.com/photo/2017/08/04/22/36/sorrow-2581703_1280.jpg'),
            fit: BoxFit.cover)),
    height: (width - 24) * 0.40,
  );
}

Widget section3(
    List<String> roles, String title, double width, bool isBookmarked) {
  String joinedString = joinStrings(roles);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.75,
            child: Text(
              joinedString,
              softWrap: true,
              style: const TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: fontSize4,
                  color: Color(0xff000000)),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: fontSize3, color: shade2),
          ),
        ],
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline))
    ],
  );
}

Widget section4(String type, String? language) {
  return Row(
    children: [tagContainer(type), sizedBoxW10(), tagContainer(language)],
  );
}

Widget tagContainer(String? tagtext) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 1, color: shade4),
        color: Colors.transparent),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Text(
        tagtext ?? 'Not given',
        style: const TextStyle(fontSize: fontSize5, color: shade3),
      ),
    ),
  );
}

String joinStrings(List<String> strings) {
  return strings.join(', ');
}

Widget recommendedCastingcallCard({
  BuildContext? context,
  String? author,
  List<String>? roles,
  String? title,
  String? type,
  String? imageUrl,
  String? language,
  required double width,
}) {
  bool isBookmarked = true;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 4),
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            section1(author!),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3ForRecommended(roles!, title!, width, isBookmarked),
            sizedBoxH10(),
            section4(type!, language!)
          ],
        ),
      ),
    ),
  );
}

Widget section3ForRecommended(
    List<String> roles, String title, double width, bool isBookMarked) {
  String joinedString = joinStrings(roles);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.75,
            child: Text(
              joinedString,
              softWrap: true,
              style: const TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: fontSize4,
                  color: Color(0xff000000),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: fontSize3, color: shade2),
          ),
        ],
      ),
      Icon(isBookMarked ? Icons.bookmark : Icons.bookmark_outline)
    ],
  );
}

Widget appliedCastingcallCard(
    {BuildContext? context,
    String? author,
    List<String>? roles,
    String? title,
    String? type,
    String? imageUrl,
    String? language,
    bool? isBookmarked,
    String? castingStatus}) {
  final width = MediaQuery.of(context!).size.width;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 4),
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section1(author!),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3(roles!, title!, width, isBookmarked!),
            sizedBoxH10(),
            section4(type!, language!),
            sizedBoxH10(),
            castingCallStatus(castingStatus ?? 'unreviewed'),
            sizedBox2()
          ],
        ),
      ),
    ),
  );
}

Widget castingCallStatus(String status) {
  Color textcolor;
  if (status == 'selected') {
    textcolor = selectedColor;
  } else if (status == 'rejected') {
    textcolor = rejectedColor;
  } else if (status == 'unreviewed') {
    textcolor = unreviewedColor;
  } else {
    textcolor = accentColor;
  }
  return Text(status, style: TextStyle(fontSize: fontSize3, color: textcolor));
}

Widget cdInterfaceCastingcallCard({
  BuildContext? context,
  List<String>? roles,
  String? title,
  String? type,
  String? imageUrl,
  String? language,
}) {
  final width = MediaQuery.of(context!).size.width;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 4),
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          children: [
            section1(''),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3New(roles!, title!, width),
            sizedBoxH10(),
            section4(type!, language!)
          ],
        ),
      ),
    ),
  );
}

Widget section3New(List<String> roles, String title, double width) {
  String joinedString = joinStrings(roles);
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.75,
            child: Text(
              joinedString,
              softWrap: true,
              style: const TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: fontSize4,
                  color: Color(0xff000000)),
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: fontSize3, color: shade2),
          ),
        ],
      ),
    ],
  );
}

Widget cdHomeCastingcallCard({
  BuildContext? context,
  List<String>? roles,
  String? title,
  String? type,
  String? imageUrl,
  String? language,
  int? count,
}) {
  final width = MediaQuery.of(context!).size.width;
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 1),
                blurRadius: 4),
          ],
          color: const Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section1(''),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3New(roles!, title!, width),
            sizedBoxH10(),
            totalProfileCount(count!)
          ],
        ),
      ),
    ),
  );
}

Widget totalProfileCount(int count) {
  return Container(
    decoration: BoxDecoration(border: Border.all(width: 1,color: accentColor),borderRadius: BorderRadius.circular(7)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Text('$count Profiles Received',style: const TextStyle(fontSize: fontSize3, color: accentColor),),
    ),
  );
}
