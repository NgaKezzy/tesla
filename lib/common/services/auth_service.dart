import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:telsa_mobile/common/models/request/sign_in_request.dart';
import 'package:telsa_mobile/common/models/response/base_response.dart';
import 'package:telsa_mobile/core/constants/url_constants.dart';
import 'package:telsa_mobile/features/auth/model/user.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: UrlConstants.baseUrl)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST(UrlConstants.login)
  Future<BaseResponse<User>> signIn(@Body() SignInRequest request);

  @POST(UrlConstants.logout)
  Future<void> logout();
}
