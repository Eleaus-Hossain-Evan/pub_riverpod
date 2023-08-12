import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/provider.dart';
import 'pub_ui/appbar.dart';
import 'pub_ui/package_detail_body.dart';
import 'search_page.dart';

// TODO hot-reload handle provider type change
// TODO hot-reload handle provider response type change
// TODO hot-reload handle provider -> family
// TODO hot-reload handle family adding parameters
// TODO found "Future already completed error" after adding family parameter

/// The detail page of a package, typically reached by clicking on a package from [SearchPage].
class PackageDetailPage extends ConsumerWidget {
  const PackageDetailPage({super.key, required this.packageName});

  /// The name of the package that is inspected.
  final String packageName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package =
        ref.watch(fetchPackageDetailsProvider(packageName: packageName));

    final likedPackages = ref.watch(likedPackagesProvider);
    final isLiked = likedPackages.valueOrNull?.contains(packageName) ?? false;

    final metrics = ref.watch(packageMetricsProvider(packageName: packageName));

    return Scaffold(
      appBar: const PubAppbar(),
      body: package.when(
        error: (err, stack) => Text('Error2 $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (package) {
          return RefreshIndicator(
            onRefresh: () {
              return Future.wait([
                ref.refresh(
                  packageMetricsProvider(packageName: packageName).future,
                ),
                ref.refresh(
                  fetchPackageDetailsProvider(packageName: packageName).future,
                ),
              ]);
            },
            child: metrics.when(
              error: (err, stack) => Text('Error $err'),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (metrics) {
                return PackageDetailBodyScrollView(
                  packageName: packageName,
                  packageVersion: package.latest.version,
                  packageDescription: package.latest.pubspec.description,
                  grantedPoints: metrics.grantedPoints,
                  likeCount: metrics.likeCount,
                  maxPoints: metrics.maxPoints,
                  popularityScore: metrics.popularityScore * 100,
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final packageLikes = ref.read(
            packageMetricsProvider(packageName: packageName).notifier,
          );

          if (isLiked) {
            await packageLikes.unlike();
          } else {
            await packageLikes.like();
          }
        },
        child: isLiked
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
