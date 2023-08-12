// ignore: undefined_hidden_name
import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'detail.dart';
import 'providers/provider.dart';
import 'pub_ui/appbar.dart';
import 'pub_ui/package_item.dart';
import 'pub_ui/searchbar.dart';

const packagesPackageSize = 100;
const searchPageSize = 10;

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);

    return Scaffold(
      appBar: const PubAppbar(),
      body: Column(
        children: [
          SearchBar(controller: searchController),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                // disposes the pages previously fetched. Next read will refresh them
                ref.invalidate(fetchPackagesProvider);
                // keep showing the progress indicator until the first page is fetched
                return ref.read(
                  fetchPackagesProvider(page: 1, search: searchController.text)
                      .future,
                );
              },
              child: ListView.custom(
                padding: const EdgeInsets.only(top: 30),
                childrenDelegate: SliverChildBuilderDelegate((context, index) {
                  final pageSize = searchController.text.isEmpty
                      ? packagesPackageSize
                      : searchPageSize;

                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;
                  final packageList = ref.watch(
                    fetchPackagesProvider(
                      page: page,
                      search: searchController.text,
                    ),
                  );

                  return packageList.when(
                    error: (err, stack) => Text('Error $err'),
                    loading: () => const PackageItemShimmer(),
                    data: (packages) {
                      if (indexInPage >= packages.length) return null;

                      final package = packages[indexInPage];

                      return PackageItem(
                        name: package.name,
                        description: package.latest.pubspec.description,
                        version: package.latest.version,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) {
                              return PackageDetailPage(
                                packageName: package.name,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
