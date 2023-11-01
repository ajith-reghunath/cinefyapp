import 'package:cinefy/application/bloc_user/user_bloc.dart';
import 'package:cinefy/application/bookmark_bloc/bookmark_bloc_bloc.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    String? time,
    String? postID}) {
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
            section1(author!, time ?? '1 day ago'),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3(roles!, title!, width, postID!),
            sizedBoxH10(),
            section4(type!, language!)
          ],
        ),
      ),
    ),
  );
}

Widget section1(String author, String time) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        author,
        style: const TextStyle(color: shade2, fontSize: fontSize5),
      ),
      Text(
        time,
        style: const TextStyle(color: shade2, fontSize: 11),
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

Widget section3(List<String> roles, String title, double width, String postID) {
  String joinedString = joinStrings(roles);
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, userState) {
      return BlocBuilder<BookmarkBlocBloc, BookmarkBlocState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
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
                  onPressed: () {
                    print(state.bookmarkedList.contains(postID));
                    if (state.bookmarkedList.contains(postID)) {
                      state.bookmarkedList.remove(postID);
                      state.userBookMarked!.data!
                          .removeWhere((data) => data.sId == postID);
                    } else {
                      state.bookmarkedList.add(postID);
                    }
                    context.read<BookmarkBlocBloc>().add(RefreshBookmark());
                    //called bookmark api
                    // context.read<UserBloc>().add(Bookmark(postID: postID));
                    context.read<BookmarkBlocBloc>().add(
                        BookmarkPost(postID: postID, userID: userState.sId!));
                    // context.read<BookmarkBlocBloc>().add(LoadBookmarks());
                  },
                  icon: Icon(state.bookmarkedList.contains(postID)
                      ? Icons.bookmark
                      : Icons.bookmark_outline))
            ],
          );
        },
      );
    },
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

Widget recommendedCastingcallCard(
    {BuildContext? context,
    String? author,
    List<String>? roles,
    String? title,
    String? type,
    String? imageUrl,
    String? language,
    required double width,
    String? time,
    String? postID}) {
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
            section1(author!, time ?? '1 day ago'),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3ForRecommended(roles!, title!, width, postID!),
            sizedBoxH10(),
            section4(type!, language!)
          ],
        ),
      ),
    ),
  );
}

Widget section3ForRecommended(
    List<String> roles, String title, double width, String postID) {
  String joinedString = joinStrings(roles);
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, userState) {
      return BlocBuilder<BookmarkBlocBloc, BookmarkBlocState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
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
                    style: const TextStyle(fontSize: fontSize3, color: shade2),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    print(state.bookmarkedList.contains(postID));
                    if (state.bookmarkedList.contains(postID)) {
                      state.bookmarkedList.remove(postID);
                      state.userBookMarked!.data!
                          .removeWhere((data) => data.sId == postID);
                    } else {
                      state.bookmarkedList.add(postID);
                    }
                    context.read<BookmarkBlocBloc>().add(RefreshBookmark());
                    //called bookmark api
                    // context.read<UserBloc>().add(Bookmark(postID: postID));
                    context.read<BookmarkBlocBloc>().add(
                        BookmarkPost(postID: postID, userID: userState.sId!));
                    // context.read<BookmarkBlocBloc>().add(LoadBookmarks());
                  },
                  icon: Icon(state.bookmarkedList.contains(postID)
                      ? Icons.bookmark
                      : Icons.bookmark_outline))
            ],
          );
        },
      );
    },
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
    String? castingStatus,
    String? time,
    String? postID}) {
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
            section1(author!, time ?? '1 day ago'),
            sizedBoxH10(),
            section2(width, imageUrl),
            sizedBoxH10(),
            section3(roles!, title!, width, postID!),
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
  if (status == 'Selected') {
    textcolor = selectedColor;
  } else if (status == 'Rejected') {
    textcolor = rejectedColor;
  } else if (status == 'unreviewed') {
    textcolor = unreviewedColor;
  } else {
    status = 'reviewing';
    textcolor = reviewingColor;
  }
  return Text(status, style: TextStyle(fontSize: fontSize3, color: textcolor));
}

Widget cdInterfaceCastingcallCard(
    {BuildContext? context,
    List<String>? roles,
    String? title,
    String? type,
    String? imageUrl,
    String? language,
    String? time}) {
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
            section1('', time ?? '1 day ago'),
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
          SizedBox(
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

Widget cdHomeCastingcallCard(
    {BuildContext? context,
    List<String>? roles,
    String? title,
    String? type,
    String? imageUrl,
    String? language,
    int? count,
    String? time}) {
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
            section1('', time ?? '1 day ago'),
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
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: accentColor),
        borderRadius: BorderRadius.circular(7)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Text(
        '$count Profiles Received',
        style: const TextStyle(fontSize: fontSize3, color: accentColor),
      ),
    ),
  );
}
