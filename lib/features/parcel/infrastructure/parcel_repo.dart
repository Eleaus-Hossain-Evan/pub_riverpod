import '../../../core/core.dart';
import '../domin/fetch_all_parcel_reponse.dart';
import '../presentation/parcel_list_screen.dart';

class ParcelRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, FetchAllParcelResponse>> fetchParcelList({
    ParcelListType type = ParcelListType.all,
    int page = 1,
    int limit = 10,
  }) async {
    final data = await api.post(
      body: {"status": type.value},
      fromData: (json) => FetchAllParcelResponse.fromMap(json),
      endPoint: "${APIRoute.FETCH_ALL_PARCEL}?page=$page&limit=$limit",
      withToken: true,
    );

    return data;
  }
}
