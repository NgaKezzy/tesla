import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:telsa_mobile/common/models/request/create_department_request.dart';
import 'package:telsa_mobile/common/models/request/create_employee_request.dart';
import 'package:telsa_mobile/common/models/response/base_response.dart';
import 'package:telsa_mobile/core/constants/url_constants.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';

part 'other_service.g.dart';

@RestApi(baseUrl: UrlConstants.baseUrl)
abstract class OtherService {
  factory OtherService(Dio dio) = _OtherService;

  @POST(UrlConstants.createDepartment)
  Future<BaseResponse<Department>> createDepartment(
      @Body() CreateOrEditDepartmentRequest request);

  @GET(UrlConstants.createDepartment)
  Future<BaseResponse<List<Department>>> getAllDepartment(
    @Query("page") int? page,
    @Query("limit") int? limit,
  );

  @DELETE('${UrlConstants.createDepartment}/{id}')
  Future<BaseResponse> deleteDepartment(@Path() int id);

  @PUT('${UrlConstants.createDepartment}/{id}')
  Future<BaseResponse> updateDepartment(
      @Path() int id, @Body() CreateOrEditDepartmentRequest request);

  @GET(UrlConstants.employee)
  Future<BaseResponse<List<Employee>>> getAllEmployee(
    @Query("page") int? page,
    @Query("limit") int? limit,
  );

  @POST(UrlConstants.employee)
  @MultiPart()
  Future<BaseResponse> createEmployee(
    @Part(name: "full_name") String fullName,
    @Part(name: "is_create_account") bool isCreateAccount,
    @Part(name: "username") String username,
    @Part(name: "password") String password,
    @Part(name: "code") String code,
    @Part(name: "department_id") int departmentId,
    @Part(name: "position") String position,
    @Part(name: "phone_number") String phoneNumber,
    @Part(name: "email") String email,
    @Part(name: "gender") String gender,
    @Part(name: "address") String address,
    @Part(name: "description") String description,
    @Part(name: "dob") String dob,
    @Part(name: "avatar") File? avatar,
  );

  @PUT('${UrlConstants.employee}/{id}')
  @MultiPart()
  Future<BaseResponse> updateEmployee(
    @Path() int id,
    @Part(name: "full_name") String fullName,
    @Part(name: "is_create_account") bool isCreateAccount,
    @Part(name: "username") String username,
    @Part(name: "password") String password,
    @Part(name: "code") String code,
    @Part(name: "department_id") int departmentId,
    @Part(name: "position") String position,
    @Part(name: "phone_number") String phoneNumber,
    @Part(name: "email") String email,
    @Part(name: "gender") String gender,
    @Part(name: "address") String? address,
    @Part(name: "description") String? description,
    @Part(name: "dob") String? dob,
    @Part(name: "avatar") File? avatar,
  );

  @DELETE('${UrlConstants.employee}/{id}')
  Future<BaseResponse> deleteEmployee(@Path() int id);

  @POST(UrlConstants.products)
  @MultiPart()
  Future<BaseResponse> createProduct(
    @Part(name: "name") String fullName,
    @Part(name: "code") String code,
    @Part(name: "category_id") int categoryId,
    @Part(name: "price") String price,
    @Part(name: "unit") String unit,
    @Part(name: "specification") String specification,
    @Part(name: "description") String description,
    @Part(name: "picture") File? picture,
  );

  @GET(UrlConstants.products)
  Future<BaseResponse<List<Product>>> getAllProduct(
    @Query("page") int? page,
    @Query("limit") int? limit,
    @Query("s_category_id") int sCategoryId,
  );

  @DELETE('${UrlConstants.products}/{id}')
  Future<BaseResponse> deleteProduct(@Path() int id);

  @PUT('${UrlConstants.products}/{id}')
  @MultiPart()
  Future<BaseResponse> updateProduct(
    @Path() int id,
    @Part(name: "name") String fullName,
    @Part(name: "code") String code,
    @Part(name: "category_id") int categoryId,
    @Part(name: "price") String price,
    @Part(name: "unit") String unit,
    @Part(name: "specification") String specification,
    @Part(name: "description") String description,
    @Part(name: "picture") File? picture,
  );
}
