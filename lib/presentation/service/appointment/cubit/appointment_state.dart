part of 'appointment_cubit.dart';

class AppointmentState extends Equatable {
  final bool? isLoading;
  final String? message;
  final List<ServiceCategory> serviceCategories;
  final List<Service> services;
  final ServiceCategory? selectedServiceCategory;
  final Service? selectedService;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final bool? isFetch;

  const AppointmentState({
    this.isLoading,
    this.message,
    required this.serviceCategories,
    required this.services,
    this.selectedServiceCategory,
    this.selectedService,
    this.selectedDate,
    this.selectedTime,
    this.isFetch,
  });

  AppointmentState copyWith({
    bool? isFetch,
    bool? isLoading,
    String? message,
    List<ServiceCategory>? serviceCategories,
    List<Service>? services,
    ServiceCategory? selectedServiceCategory,
    Service? selectedService,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
  }) {
    return AppointmentState(
      isFetch: isFetch ?? this.isFetch,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      serviceCategories: serviceCategories ?? this.serviceCategories,
      services: services ?? this.services,
      selectedServiceCategory:
          selectedServiceCategory ?? this.selectedServiceCategory,
      selectedService: selectedService ?? this.selectedService,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        message,
        serviceCategories,
        services,
        selectedServiceCategory,
        selectedService,
        selectedDate,
        selectedTime,
        isFetch,
      ];
}
