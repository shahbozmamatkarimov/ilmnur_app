import 'package:dio/dio.dart';
import 'package:ilmnur_app/features/home/data/models/group/GroupDto.dart';
import 'package:ilmnur_app/features/home/data/models/group/creategroup.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ilmnur_app/core/network/urls.dart';
import 'package:ilmnur_app/core/network/dio_manager.dart';

part 'group_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class GroupService {
  factory GroupService(Dio dio, {String baseUrl}) = _GroupService;

  static Future<GroupService> create() async {
    final dio = await DioManager.getDio; // Future<Dio> qaytaradi
    return GroupService(dio);
  }

  @GET("group")
  Future<HttpResponse<GroupDto>> getGroups();

  @POST("group/create")
  Future<HttpResponse<CreateGroupModel>> createGroup(
    @Body() FormData groupData,
  );
}
