import 'package:cinefy/presentation/cd_interface/cd_interface.dart';
import 'package:flutter/material.dart';
import 'package:cinefy/application/casting_call_bloc/casting_call_bloc.dart';
import 'package:cinefy/application/login_bloc/login_bloc.dart';
import 'package:cinefy/application/login_bloc/login_state.dart';
import 'package:cinefy/application/sign_up_bloc/sign_up_bloc.dart';
import 'package:cinefy/domain/casting_call/casting_call_model.dart';
import 'package:cinefy/presentation/common%20widgets/common_widgets.dart';
import 'package:cinefy/presentation/home/widgets/screen_home_widgets.dart';
import 'package:cinefy/core/colors.dart';
import 'package:cinefy/presentation/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/bloc_user/user_bloc.dart';
import '../../application/bloc_user/user_event.dart';
import '../../core/constants.dart';
import '../common widgets/casting call card/castingCallCard.dart';

// ignore: must_be_immutable
class ScreenCdHome extends StatelessWidget {
  ScreenCdHome({super.key});
  String? name;
  int call = 1;
  List<CastingCallModel> castingCallList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastingCallBloc, CastingCallState>(
      builder: (context, castingCallstate) {
        return BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, signUpState) {
            return BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (call == 1) {
                      print('Call : $call');
                      call = 0;
                    }

                    Stream stream = controller.stream;
                    stream.listen((value) {
                      context.read<UserBloc>().add(LoadUser(response: value));
                    });

                    final width = MediaQuery.of(context).size.width;
                    final height = MediaQuery.of(context).size.height;

                    refresh() async {
                      context.read<CastingCallBloc>().add(LoadCastingCall());
                    }

                    return RefreshIndicator(
                      color: accentColor,
                      onRefresh: refresh,
                      child: Visibility(
                        visible: userState.email != null,
                        replacement: SizedBox(
                          width: width,
                          height: height,
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: accentColor,
                          )),
                        ),
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              pinned: false,
                              snap: false,
                              collapsedHeight: 85,
                              floating: true,

                              // bottom: AppBar(title: Text('cinefy',style: TextStyle(color: Colors.white),),centerTitle: true,),
                              backgroundColor: secondaryColor,
                              flexibleSpace: FlexibleSpaceBar(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          options(context);
                                        },
                                        icon: const Icon(
                                          Icons.menu,
                                          size: 30,
                                          color: shade4,
                                        )),
                                    Container(
                                      width: 100,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/cinefy logo.png'),
                                            fit: BoxFit.cover,
                                            scale: 2.0),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                              return ScreenSearch();
                                            }),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.search,
                                          size: 30,
                                          color: shade4,
                                        )),
                                  ],
                                ),
                                centerTitle: true,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sizedBoxH20(),
                                  topSection(userState.name ?? 'artist', width),
                                ],
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Visibility(
                                    visible: castingCallstate.castingCallList !=
                                        null,
                                    replacement: SizedBox(
                                      height: 200,
                                      width: width,
                                      child: const CircularProgressIndicator(),
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          context.read<CastingCallBloc>().add(
                                              AddToSortedList(
                                                  applicants: castingCallstate
                                                      .castingCallList![index]
                                                      .applicants));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                              return CastingDirectorInterface(
                                                  index: index);
                                              // ScreenCastingCall(
                                              //   index: index,
                                              //   isBookmarked: userState.bookmark!
                                              //       .contains(castingCallstate
                                              //           .castingCallList![index]
                                              //           .sId),
                                              // );
                                            }),
                                          );
                                        },
                                        child: cdHomeCastingcallCard(
                                          context: context,
                                          title: castingCallstate
                                              .castingCallList![index].title,
                                          roles: castingCallstate
                                              .castingCallList![index].roles,
                                          type: castingCallstate
                                              .castingCallList![index]
                                              .projectType,
                                          imageUrl:
                                              'https://app.nex-gen.shop/${castingCallstate.castingCallList![index].image}',
                                          language: castingCallstate
                                                  .castingCallList![index]
                                                  .language!
                                                  .isEmpty
                                              ? 'not given'
                                              : castingCallstate
                                                  .castingCallList![index]
                                                  .language![0]
                                                  .toString(),
                                          count: castingCallstate
                                                  .castingCallList![index].applicants!.length
                                        )
                                        //   castingcallCard(
                                        //       context: context,
                                        //       title: castingCallstate
                                        //           .castingCallList![index].title,
                                        //       roles: castingCallstate
                                        //           .castingCallList![index].roles,
                                        //       author: castingCallstate
                                        //           .castingCallList![index]
                                        //           .author!
                                        //           .name,
                                        //       type: castingCallstate
                                        //           .castingCallList![index]
                                        //           .projectType,
                                        //       imageUrl:
                                        //           'https://app.nex-gen.shop/${castingCallstate.castingCallList![index].image}',
                                        //       language: castingCallstate
                                        //               .castingCallList![index]
                                        //               .language!
                                        //               .isEmpty
                                        //           ? 'not given'
                                        //           : castingCallstate
                                        //               .castingCallList![index]
                                        //               .language![0]
                                        //               .toString(),
                                        //       isBookmarked: userState.bookmark!
                                        //           .contains(castingCallstate
                                        //               .castingCallList![index].sId)),
                                        // ),
                                        ));
                              },
                              childCount:
                                  castingCallstate.castingCallList!.length,
                            ))
                          ],
                        ),
                      ),
                    );
                    // Column(
                    //   children: [
                    //     Container(decoration: const BoxDecoration(color: secondaryColor),width: width,height: 60,),
                    //     TextButton(
                    //         onPressed: () async {
                    //           List<CurrentUserModel> userdetails =
                    //               await getAllUsers();
                    //           // print(userdetails[0].id);
                    //           print(userState.sId);
                    //         },
                    //         child: const Text('Press me')),
                    //     ElevatedButton(
                    //         onPressed: () async {
                    //           context.read<LoginBloc>().add(LogOut());
                    //           Navigator.pushReplacement(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: (BuildContext context) {
                    //               return (LoginScreen());
                    //             }),
                    //           );
                    //           await clearUserData();
                    //         },
                    //         child: const Text('log out')),
                    //     Visibility(
                    //       visible: castingCallstate.castingCallList != null,
                    //       replacement: const Center(
                    //         child: CircularProgressIndicator(),
                    //       ),
                    //       child: Expanded(
                    //         child: ListView.builder(

                    //             itemCount:
                    //                 castingCallstate.castingCallList!.length,
                    //             itemBuilder: (_, int index) {
                    //               return GestureDetector(
                    //                 onTap: () {
                    //                   Navigator.push(
                    //                     context,
                    //                     MaterialPageRoute(
                    //                         builder: (BuildContext context) {
                    //                       return ScreenCastingCall(
                    //                           index: index);
                    //                     }),
                    //                   );
                    //                 },
                    //                 child: castingcallCard(
                    //                     context: context,
                    //                     title: castingCallstate
                    //                         .castingCallList![index].title,
                    //                     roles: castingCallstate
                    //                         .castingCallList![index].roles,
                    //                     author: castingCallstate
                    //                         .castingCallList![index]
                    //                         .author!
                    //                         .name,
                    //                     type: castingCallstate
                    //                         .castingCallList![index]
                    //                         .projectType,
                    //                     imageUrl:
                    //                         'https://app.nex-gen.shop/${castingCallstate.castingCallList![index].image}',
                    //                     language: castingCallstate
                    //                             .castingCallList![index]
                    //                             .language!
                    //                             .isEmpty
                    //                         ? 'not given'
                    //                         : castingCallstate
                    //                             .castingCallList![index]
                    //                             .language![0]
                    //                             .toString()),
                    //               );
                    //             }
                    //             ),
                    //       ),
                    //     )
                    //   ],
                    // );

                    //stop
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
