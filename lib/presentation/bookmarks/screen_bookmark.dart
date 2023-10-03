import 'package:cinefy/application/bookmark_bloc/bookmark_bloc_bloc.dart';
import 'package:cinefy/presentation/castingcall/screen_casting_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/colors.dart';
import '../../domain/time_ago/time_display.dart';
import '../common widgets/casting call card/castingCallCard.dart';
import '../common widgets/common_widgets.dart';

// ignore: must_be_immutable
class ScreenBookmark extends StatelessWidget {
  ScreenBookmark({super.key});
  int call = 1;

  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BookmarkBlocBloc, BookmarkBlocState>(
        builder: (context, state) {
          if (call == 1) {
            print('bbbbbb called');
            // context.read<BookmarkBlocBloc>().add(LoadBookmarks());
            call = 0;
          }

          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  child: Center(child: screenTitle('Bookmarks')),
                ),
                sizedBoxH10(),
                // TextButton(
                //     onPressed: () {
                //       for (int i = 0;
                //           i < state.appliedCastingCallList.length;
                //           i++) {
                //         print(state.appliedCastingCallList[i].title
                //             .toString());
                //       }
                //     },
                //     child: Text('click me')),
                // TextButton(
                //     onPressed: () {
                //       context
                //           .read<CastingCallBloc>()
                //           .add(AppliedCastingCalls());
                //     },
                //     child: Text('load')),
                Visibility(
                  visible: state.userBookMarked != null,
                  replacement: SizedBox(
                    height: 0.7 * height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: accentColor,
                      ),
                    ),
                  ),
                  child: Expanded(
                    child: state.bookmarkedList.isEmpty ? const Center(child: Text('No bookmarks to show')) : ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return ScreenCastingCall(index: index);
                              }),
                            );
                          },
                          child: castingcallCard(
                              context: context,
                              title: state.userBookMarked!.data![index].title,
                              roles: state.userBookMarked!.data![index].roles,
                              author: 'Publisher',
                              type: state
                                  .userBookMarked!.data![index].projectType,
                              imageUrl:
                                  'https://app.nex-gen.shop/${state.userBookMarked!.data![index].image}',
                              language: state.userBookMarked!.data![index]
                                      .language!.isEmpty
                                  ? 'not given'
                                  : state
                                      .userBookMarked!.data![index].language![0]
                                      .toString(),
                              time: TimeDisplay().getTime(state
                                  .userBookMarked!.data![index].createdAt!),
                              postID: state.userBookMarked!.data![index].sId),
                        );
                      },
                      itemCount: state.userBookMarked!.data!.length,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
