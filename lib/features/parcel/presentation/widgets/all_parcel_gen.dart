import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/core.dart';

import '../../application/parcel_provider.dart';
import '../parcel_list_screen.dart';

const packagesPackageSize = 100;
const searchPageSize = 10;

class AllParcelGen extends HookConsumerWidget {
  const AllParcelGen({
    super.key,
    required this.listType,
  });

  final ParcelListType listType;

  @override
  Widget build(BuildContext context, ref) {
    final loading = useState(false);
    final state = ref.watch(parcelProvider);

    // ref.listen(parcelProvider, (previous, next) {
    //   if (previous!.loading == false && next.loading) {
    //     BotToast.showLoading();
    //     loading.value = true;
    //   }
    //   if (previous.loading == true && next.loading == false) {
    //     BotToast.closeAllLoading();
    //     loading.value = false;
    //   }
    // });

    useEffect(() {
      // Future.microtask(() => ref
      //     .read(parcelProvider.notifier)
      //     .fetchCategorizedParcel(type: listType));
      return () => BotToast.closeAllLoading();
    }, const []);

    return Center(
      child: ListView.custom(
        padding: padding0,
        // alternateWidget:
        //     "No order placed yet!".text.caption(context).make().objectCenter(),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const pageSize = searchPageSize;

            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;
            final parcelList = ref.watch(
              fetchCategorizedParcelProvider(
                type: listType,
                page: page,
              ),
            );

            return parcelList.when(
              data: (data) {
                if (indexInPage >= data.length) return null;

                final parcel = data[indexInPage];
                return DeliveryListTile(
                  customerName: parcel.customerInfo.name,
                  address: "169/B, North Konipara, Tejgoan, Dhaka, Bangladesh",
                  price: parcel.regularPayment.cashCollection.toString(),
                  serialId: parcel.serialId,
                  status: parcel.regularStatus,
                );
              },
              error: (err, stack) {
                Logger.e(err);
                return Text('Error $err');
              },
              loading: () => const PackageItemShimmer(),
            );
          },
        ),
      ),
    );
  }
}

class PackageItemShimmer extends StatelessWidget {
  const PackageItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: ListTile(
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                Container(
                  height: DefaultTextStyle.of(context).style.fontSize! * .8,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: DefaultTextStyle.of(context).style.fontSize! * .8,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        subtitle: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Container(
                    height: DefaultTextStyle.of(context).style.fontSize! * .8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: DefaultTextStyle.of(context).style.fontSize! * .8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
