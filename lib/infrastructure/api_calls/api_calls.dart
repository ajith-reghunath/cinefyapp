import 'package:cinefy/infrastructure/api_calls/base_client.dart' as baseClient;
import 'package:file_picker/file_picker.dart';

import '../../domain/Login/log_in_model.dart';
import '../../domain/sign_up/sign_up_model.dart';

abstract class ApiRepository {
  Future<dynamic>? userLogin(LoginModel userLogin);
  Future<dynamic>? userSignUp(UserSignUp userSignUp);
  Future<dynamic>? createCastingCall({
    PlatformFile? pickFile,
    String ?title,
    String ?subTitle,
    String ?shortDescription,
    String ?projectType,
    String ?director,
    List<String> ?roles,
    String ?gender,
    List<String> ?ageRange,
    String ?location,
    String ?description,
    List<String> ?languages,
  });
}

class ApiCalls extends ApiRepository {
  @override
  Future<dynamic>? userLogin(LoginModel userLogin) async {
    final response =
        await baseClient.BaseClient().loginApi('/login', userLogin);
    return response;
  }

  @override
  Future<dynamic>? userSignUp(UserSignUp userSignUp) async {
    final response =
        await baseClient.BaseClient().signUpApi('/signup', userSignUp);
    return response;
  }

  @override
  Future? createCastingCall({
    PlatformFile? pickFile,
    String ?title,
    String ?subTitle,
    String ?shortDescription,
    String ?projectType,
    String ?director,
    List<String> ?roles,
    String ?gender,
    List<String> ?ageRange,
    String ?location,
    String ?description,
    List<String> ?languages,
  }) async {
    final response =
        await baseClient.BaseClient().createCcApi(urlEndPoint: '/createPost',pickFile: pickFile, title: title,subTitle: subTitle, shortDescription: shortDescription, projectType: projectType, director: director, roles: roles,gender: gender,ageRange: ageRange,location: location,languages: languages);
    return response;
  }
}
