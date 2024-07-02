import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../gen/assets.gen.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture
                      .asset(
                    Assets
                        .icons
                        .common
                        .filter
                        .path,
                    height: 24,
                    width: 24,
                  ),
                ),
                Text(
                  AppLocalizations.of(
                      context)!
                      .filter,
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineMedium,
                ),
                IconButton(
                    onPressed:
                        () {},
                    icon: const Icon(
                        Icons
                            .close)),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  // TODO
                  // AppLocalizations.of(context)!.priceRange,
                  'Price Range',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  '\$0 - \$100',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  //  TODO
                  // AppLocalizations.of(context)!.rating,
                  'Rating',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  '4.5',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  // TODO
                  // AppLocalizations.of(context)!.brand,
                  'Brand',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  'Samsung',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  // TODO:
                  // AppLocalizations.of(context)!.color,
                  'Color',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  'Black',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  // TODO
                  // AppLocalizations.of(context)!.size,
                  'Size',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  'Large',
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
            const SizedBox(
                height: 16),
            const Divider(),
            const SizedBox(
                height: 16),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(
                      context)!
                      .clearAll,
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
                Text(
                  AppLocalizations.of(
                      context)!
                      .apply,
                  style: Theme.of(
                      context)
                      .textTheme
                      .headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
