import 'package:bongtuyettrang/domain/models/service/service.dart';
import 'package:bongtuyettrang/domain/models/service/service_category.dart';
import 'package:bongtuyettrang/presentation/widgets/commons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'cubit/appointment_cubit.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  late final AppointmentCubit _cubit;

  final TextEditingController _serviceCategoryController =
      TextEditingController();
  final TextEditingController _serviceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
    if (_cubit.state.isFetch == false || _cubit.state.isFetch == null) {
      _cubit.getServiceCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Stack(
          children: [
            Material(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(AppLocalizations.of(context)!.appointment),
                ),
                body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!
                                .selectServiceCategory),
                            const SizedBox(height: 16),
                            DropdownMenu(
                              expandedInsets: const EdgeInsets.all(0),
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              menuHeight: 500,
                              menuStyle: MenuStyle(
                                backgroundColor:
                                    const WidgetStatePropertyAll<Color>(
                                        Colors.white),
                                elevation:
                                    const WidgetStatePropertyAll<double>(4),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              leadingIcon: const Icon(Icons.category),
                              hintText: AppLocalizations.of(context)!.select,
                              enableSearch: true,
                              controller: _serviceCategoryController,
                              dropdownMenuEntries: state.serviceCategories
                                  .map((ServiceCategory serviceCategory) {
                                return DropdownMenuEntry(
                                  style: const ButtonStyle(
                                    textStyle:
                                        WidgetStatePropertyAll<TextStyle>(
                                      TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  value: serviceCategory,
                                  label: serviceCategory.categoryName,
                                );
                              }).toList(),
                              onSelected: (value) {
                                FocusScope.of(context).unfocus();
                                if (value is ServiceCategory) {
                                  _serviceCategoryController.text =
                                      (value).categoryName;
                                  _serviceController.text = '';
                                  _cubit.setSelectServiceCategory(value);
                                  _cubit.getServiceByCategory(value.id);
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                            Text(AppLocalizations.of(context)!.selectService),
                            const SizedBox(height: 16),
                            DropdownMenu(
                              enabled:
                                  _serviceCategoryController.text.isNotEmpty &&
                                      state.selectedServiceCategory != null &&
                                      state.services.isNotEmpty,
                              expandedInsets: const EdgeInsets.all(0),
                              controller: _serviceController,
                              menuHeight: 300,
                              menuStyle: MenuStyle(
                                backgroundColor:
                                    const WidgetStatePropertyAll<Color>(
                                        Colors.white),
                                elevation:
                                    const WidgetStatePropertyAll<double>(4),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              inputDecorationTheme: InputDecorationTheme(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              leadingIcon: const Icon(Icons.cleaning_services),
                              hintText: AppLocalizations.of(context)!.select,
                              dropdownMenuEntries:
                                  state.services.map((Service service) {
                                return DropdownMenuEntry(
                                  style: const ButtonStyle(
                                    textStyle:
                                        WidgetStatePropertyAll<TextStyle>(
                                      TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  value: service,
                                  label: service.serviceName,
                                );
                              }).toList(),
                              onSelected: (value) {
                                FocusScope.of(context).unfocus();
                                if (value is Service) {
                                  _serviceController.text = (value).serviceName;
                                  _cubit.setSelectService(value);
                                  // _cubit.getServiceDetail(value.id);
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                            if (state.selectedService != null &&
                                _serviceController.text.isNotEmpty)
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!
                                              .serviceDetail,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          state.selectedService!.serviceName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          state.selectedService!
                                                  .serviceDescription ??
                                              'Đặt lịch để biết thêm chi tiết về dịch vụ',
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Giá tham khảo: ${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(state.selectedService!.servicePrice)}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Text(AppLocalizations.of(context)!
                                .weWillContactToConfirm),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Divider(),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Button(
                        label: AppLocalizations.of(context)!.continueText,
                        onPressed: () {
                          showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return BlocBuilder<AppointmentCubit,
                                    AppointmentState>(
                                  builder: (context, state) {
                                    return Dialog(
                                      shadowColor: Colors.black,
                                      child: Material(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                CalendarDatePicker(
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now()
                                                        .subtract(const Duration(
                                                            days: 7)),
                                                    lastDate: DateTime.now().add(
                                                        const Duration(days: 7)),
                                                    onDateChanged: (value) {}),
                                                const SizedBox(height: 16),
                                                TextButton(
                                                  onPressed: () async {
                                                    TimeOfDay? pickedTime =
                                                        await showTimePicker(
                                                      context: context,
                                                      initialTime:
                                                          TimeOfDay.now(),
                                                    );
                                                    if (pickedTime != null) {
                                                      _cubit.setTime(pickedTime);
                                                    }
                                                  },
                                                  child: Text(
                                                    state.selectedTime != null
                                                        ? '${state.selectedTime?.hour.toString().padLeft(2, '0')}:${state.selectedTime?.minute.toString().padLeft(2, '0')}'
                                                        : AppLocalizations.of(
                                                                context)!
                                                            .pickTime,
                                                  ),
                                                ),
                                                Button(
                                                    label: AppLocalizations.of(
                                                            context)!
                                                        .confirm,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        isDisabled: state.selectedService == null,
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 16),
            if (state.isLoading == true)
              const ModalBarrier(dismissible: false, color: Colors.black45),
            if (state.isLoading == true)
              const Center(child: CircularProgressIndicator.adaptive()),
            if (state.message != null && state.message != '')
              AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  AppLocalizations.of(context)!.error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
                content: Text(state.message!),
                actions: [
                  TextButton(
                      onPressed: () {
                        _cubit.clearMessage();
                      },
                      child: Text(AppLocalizations.of(context)!.confirm))
                ],
              ),
          ],
        );
      },
    );
  }
}
