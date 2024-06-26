import 'package:bongtuyettrang/domain/models/service/service_category.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/appointment_cubit.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late final AppointmentCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AppointmentCubit>();
    _cubit.getServiceCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return Material(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Appointment'),
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
                        const Text(
                            'We will contact you to confirm the booking'),
                        const SizedBox(height: 16),
                        const Text(
                            'If you encounter any issues, please contact us'),
                        const Text('Via mobile: 0123456789'),
                        const Text('Select service category'),
                        const SizedBox(height: 16),
                        DropdownMenu(
                          expandedInsets: const EdgeInsets.all(0),
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          leadingIcon: const Icon(Icons.category),
                          hintText: 'Select category',
                          enableSearch: true,
                          enableFilter: true,
                          requestFocusOnTap: true,
                          dropdownMenuEntries: state.serviceCategories
                              .map((ServiceCategory serviceCategory) {
                            return DropdownMenuEntry(
                              value: serviceCategory,
                              label: serviceCategory.categoryName,
                            );
                          }).toList(),
                          onSelected: (value) {
                            FocusScope.of(context).unfocus();
                            if (kDebugMode) {
                              print(value);
                            }
                            if (value is ServiceCategory) {
                              _cubit.getServiceByCategory(value.id);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text('Select service'),
                        const SizedBox(height: 16),
                        DropdownMenu(
                          expandedInsets: const EdgeInsets.all(0),
                          inputDecorationTheme: InputDecorationTheme(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          leadingIcon: const Icon(Icons.cleaning_services),
                          hintText: 'Select service',
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 1, label: 'Service 1'),
                            DropdownMenuEntry(value: 2, label: 'Service 2'),
                            DropdownMenuEntry(value: 3, label: 'Service 3'),
                            DropdownMenuEntry(value: 4, label: 'Service 4'),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text('Service details'),
                                    content: const Text('Service details here'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: const Text('Click to select date and time'),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
