import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../../core/core.dart';
import '../domin/fetch_all_parcel_reponse.dart';
import '../domin/parcel_model.dart';
import '../infrastructure/parcel_repo.dart';
import '../presentation/parcel_list_screen.dart';
import 'parcel_state.dart';

part 'parcel_provider.g.dart';

final parcelProvider =
    StateNotifierProvider<ParcelNotifier, ParcelState>((ref) {
  return ParcelNotifier(ref, ParcelRepo());
}, name: "parcelProvider");

class ParcelNotifier extends StateNotifier<ParcelState> {
  final Ref ref;
  final ParcelRepo repo;
  ParcelNotifier(this.ref, this.repo) : super(ParcelState.init());

  Future<Either<CleanFailure, FetchAllParcelResponse>> fetchParcelList({
    ParcelListType type = ParcelListType.all,
    int page = 1,
    int limit = 10,
  }) async {
    final result = await repo.fetchParcelList(
      page: page,
      limit: limit,
      type: type,
    );

    return result;
  }

  void fetchCategorizedParcel(
      {ParcelListType type = ParcelListType.all, int page = 1}) async {
    state = state.copyWith(loading: true);

    final result = await fetchParcelList(type: type, page: page);

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        state = state.copyWith(loading: false);
      },
      (r) {
        switch (type) {
          case ParcelListType.all:
            state = state.copyWith(allParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.pending:
            state = state.copyWith(pendingParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.pickup:
            state = state.copyWith(pickupParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.shipping:
            state = state.copyWith(shippingParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.shipped:
            state = state.copyWith(shippedParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.dropoff:
            state = state.copyWith(dropoffParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.returns:
            state = state.copyWith(returnParcel: r.data.lock, loading: false);
            break;
          case ParcelListType.cancel:
            state = state.copyWith(cancelParcel: r.data.lock, loading: false);
            break;
          default:
            state = state.copyWith(allParcel: r.data.lock, loading: false);
        }
      },
    );
  }
}

@riverpod
Future<FetchAllParcelResponse> fetchAllParcel(
  FetchAllParcelRef ref, {
  ParcelListType type = ParcelListType.all,
  int page = 1,
  int limit = 10,
}) async {
  final uri = Uri(
    scheme: APIRoute.scheme,
    host: APIRoute.BASE_URL,
    path: APIRoute.FETCH_ALL_PARCEL,
    port: int.parse("8080", radix: 16),
    queryParameters: <String, String>{
      'page': '$page',
      'limit': '$limit',
    },
  );
  final json = await http.post(
    Uri.parse(
        "${APIRoute.BASE_URL}${APIRoute.FETCH_ALL_PARCEL}?page=$page&limit=$limit"),
    // uri,
    body: {"status": type.value},
  );

  Logger.i(json);
  return FetchAllParcelResponse.fromJson(json.body);
}

@riverpod
Future<List<ParcelModel>> fetchCategorizedParcel(
  FetchCategorizedParcelRef ref, {
  ParcelListType type = ParcelListType.all,
  int page = 1,
  int limit = 10,
}) async {
  final response = await ref.watch(
      fetchAllParcelProvider(type: type, limit: limit, page: page).future);
  return response.data;
}
