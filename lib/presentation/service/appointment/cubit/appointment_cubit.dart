import 'package:bongtuyettrang/data/network/repository/services/service_category_repository.dart';
import 'package:bongtuyettrang/data/network/repository/services/service_repository.dart';
import 'package:bongtuyettrang/domain/models/service/service_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/service/service.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final ServiceCategoryRepository serviceCategoryRepository;
  final ServiceRepository serviceRepository;

  AppointmentCubit(
      {required this.serviceCategoryRepository,
      required this.serviceRepository})
      : super(const AppointmentState(serviceCategories: [], services: []));

  Future<void> getServiceCategories() async {
    print('get service categories');
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceCategoryRepository.getServiceCategories();
      print('response: $response');
      emit(state.copyWith(
          isLoading: false,
          serviceCategories: response.data,
      ));
    } catch (e) {
      print('error: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getServiceByCategory(int categoryId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceRepository.getServiceByCategory(categoryId);
      emit(state.copyWith(isLoading: false, services: response.data));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> getServiceDetail(int serviceId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceRepository.getServiceDetail(serviceId);
      emit(state.copyWith(
          isLoading: false, selectedService: response.service!.id));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
