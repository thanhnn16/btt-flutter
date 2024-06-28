import 'package:bongtuyettrang/data/network/repository/services/service_category_repository.dart';
import 'package:bongtuyettrang/data/network/repository/services/service_repository.dart';
import 'package:bongtuyettrang/domain/models/service/service_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceCategoryRepository.getServiceCategories();
      emit(state.copyWith(
        isLoading: false,
        serviceCategories: response.data,
        isFetch: true,
      ));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isFetch: false, message: e.toString()));
    }
  }

  Future<void> getServiceByCategory(String categoryId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceRepository.getServiceByCategory(categoryId);
      emit(state.copyWith(
          isLoading: false, services: response.data, isFetch: true));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isFetch: false, message: e.toString()));
    }
  }

  Future<void> getServiceDetail(String serviceId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await serviceRepository.getServiceDetail(serviceId);
      emit(state.copyWith(
          isLoading: false,
          selectedService: response.service,
          isFetch: true));
    } catch (e) {
      if (e.toString().contains('404')) {
        emit(state.copyWith(
            isLoading: false,
            isFetch: false,
            message: 'Service not found'));
        return;
      } else if (e.toString().contains('500')) {
        emit(state.copyWith(
            isLoading: false,
            isFetch: false,
            message: 'Internal server error'));
        return;
      }
      emit(state.copyWith(
          isLoading: false, isFetch: false, message: e.toString()));
    }
  }

  Future<void> setSelectService(Service service) async {
    emit(state.copyWith(selectedService: service));
  }

  Future<void> setDate(DateTime date) async {
    emit(state.copyWith(selectedDate: date));
  }

  Future<void> setTime(TimeOfDay time) async {
    emit(state.copyWith(selectedTime: time));
  }

  Future<void> setSelectServiceCategory(ServiceCategory serviceCategory) async {
    emit(state.copyWith(selectedServiceCategory: serviceCategory));
  }

  Future<void> clearMessage() async {
    emit(state.copyWith(message: ''));
  }

  Future<void> clearServices() async {
    emit(state.copyWith(services: []));
  }

}
