import 'dart:convert';
import 'dart:io';

import 'package:cinefy/core/constants.dart';
import 'package:cinefy/core/global_variables.dart';
import 'package:cinefy/infrastructure/api_calls/exception_handlers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../domain/Login/log_in_model.dart';
import '../../domain/otp/otp_model.dart';
import '../../domain/sign_up/sign_up_model.dart';
import '../Functions/current_user_functions.dart';
import '../Models/current_user.dart';

class BaseClient {
  static const int timeDuration = 35;

  //get
  Future<dynamic> loginApi(String urlEndPoint, LoginModel userLogin) async {
    final url = apiBase + urlEndPoint;
    var uri = Uri.parse(url);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(userLogin.toDatabaseJson()),
      );
      print('status code : ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      final errorMessage = await ExceptionHandlers().getExceptionString(e);
      print('Handled Error: $errorMessage');
      logInMessage = errorMessage;
    }
  }

  Future<dynamic> signUpApi(String urlEndPoint, UserSignUp userSignUp) async {
    final url = apiBase + urlEndPoint;
    var uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(userSignUp.toDatabaseJson()));
      return _processResponse(response);
    } catch (e) {
      final errorMessage = await ExceptionHandlers().getExceptionString(e);
      print('Handled Error: $errorMessage');
      signUpMessage = errorMessage;
    }
  }

  Future<dynamic> otpApi(String urlEndPoint, OtpModel otpModel) async {
    final url = apiBase + urlEndPoint;
    var uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(otpModel.toDatabaseJson()));
      return _processResponse(response);
    } catch (e) {
      final errorMessage = await ExceptionHandlers().getExceptionString(e);
      print('Handled Error: $errorMessage');
      snackBarMessage = errorMessage;
    }
  }

  Future<dynamic> bookmarkApi(String userID) async {
    String urlEndPoint = '/bookmark?id=$userID';
    final url = apiBase + urlEndPoint;
    var uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      print('load bookmars status code : ${response.statusCode}');
      return _processResponse(response);
    } catch (e) {
      final errorMessage = await ExceptionHandlers().getExceptionString(e);
      print('Handled Error: $errorMessage');
      logInMessage = errorMessage;
    }
  }

  Future<dynamic> createCcApi({
    PlatformFile? pickFile,
    String? title,
    String? subTitle,
    String? shortDescription,
    String? projectType,
    String? director,
    List<String>? roles,
    String? gender,
    List<String>? ageRange,
    String? location,
    String? description,
    List<String>? languages,
    String? userId,
  }) async {
    // final url = 'http://10.0.2.2:5000/api/$urlEndPoint';
    const urlEndPoint = '/createPost';
    final url = apiBase + urlEndPoint;
    var uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri);

//COPIED
    print('one');
    CurrentUserModel? currentUser = await displayUserData();
    final token = currentUser!.tokenId;
    // final userID = currentUser.id;

    request.fields['title'] = title!;
    request.fields['subtitle'] = subTitle!;
    request.fields['shortdescription'] = shortDescription!;
    request.fields['author'] = userId!;
    print('xxxxx - 2');
    request.fields['projectType'] = projectType!;
    request.fields['director'] = director!;
    request.fields['gender'] = gender!;
    request.fields['location'] = location!;
    print('xxxx-3');
    // request.fields['description'] = description!;

    for (String string in roles!) {
      request.files.add(http.MultipartFile.fromString('roles', string));
    }

    for (String age in ageRange!) {
      request.files.add(http.MultipartFile.fromString('age', age));
    }

    for (String string in languages!) {
      request.files.add(http.MultipartFile.fromString('language', string));
    }

    print('xxxx-4');

    if (pickFile != null) {
      final file = File(pickFile.path!);
      final photoFile = await http.MultipartFile.fromPath(
        'image', // Field name for the file
        file.path, // Path to the file
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(photoFile);
    }

    request.headers['token'] = token!;

    print('xxxx-5');

    // Send the request

//COPIED

    try {
      final response = await request.send();
      print(response.reasonPhrase);
      return _processStreamedResponse(response);
    } catch (e) {
      final errorMessage = ExceptionHandlers().getExceptionString(e);
      print('Handled Error: $errorMessage');
      createCcMessage = errorMessage;
    }
  }

  dynamic _processResponse(http.Response response) {
    print('processResponse side , statuscode = ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        print('200 worked');
        return response;
      case 400:
        print('400 worked'); //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
        throw FetchDataException(jsonDecode(response.body)['message']);
      default:
        throw FetchDataException(jsonDecode(response.body)['message']);
    }
  }

  dynamic _processStreamedResponse(http.StreamedResponse response) {
    print('processResponse side , statuscode = ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        print('200 worked');
        return response;
      // case 400:
      //   print('400 worked'); //Bad request
      //   throw BadRequestException(jsonDecode(response.)['message']);
      // case 401: //Unauthorized
      //   throw UnAuthorizedException(jsonDecode(response.body)['message']);
      // case 403: //Forbidden
      //   throw UnAuthorizedException(jsonDecode(response.body)['message']);
      // case 404: //Resource Not Found
      //   throw NotFoundException(jsonDecode(response.body)['message']);
      // case 500: //Internal Server Error
      //   throw FetchDataException(jsonDecode(response.body)['message']);
      default:
        throw FetchDataException('Oops! try again');
    }
  }
}
