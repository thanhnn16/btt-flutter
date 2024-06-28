import '../../../responses/services/service_response.dart';
import '../../dio/api_client.dart';

class ServiceRepository {
  final apiClient = ApiClient();

  // Future<ServiceResponse> getServices() async {
  //   // TODO: implement
  //   return ServiceResponse(status: 200, message: 'Success');
  // }

  Future<ServiceResponse> getServiceDetail(String id) async {
    final response = await apiClient.dio.get('/service/$id');
    return ServiceResponse.fromJson(response.data);
  }

  Future<ServiceResponse> getServiceByCategory(String id) async {
    final response = await apiClient.dio.get('/service-by-category/$id');
    return ServiceResponse.fromJson(response.data);
  }
}