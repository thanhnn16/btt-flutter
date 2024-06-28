import 'package:bongtuyettrang/data/responses/services/service_response.dart';

import '../../../responses/services/service_category_response.dart';
import '../../dio/api_client.dart';

class ServiceCategoryRepository {
  final apiClient = ApiClient();

  Future<ServiceCategoryResponse> getServiceCategories() async {
    final response = await apiClient.dio.get('/service-categories');
    return ServiceCategoryResponse.fromJson(response.data);
  }

  Future<ServiceResponse> getServiceCategoryDetail(String id) async {
    final response = await apiClient.dio.get('/service-categories/$id');
    return ServiceResponse.fromJson(response.data);
  }
}