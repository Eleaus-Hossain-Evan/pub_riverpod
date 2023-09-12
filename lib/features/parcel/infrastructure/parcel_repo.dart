import '../../../core/core.dart';
import '../domin/fetch_all_parcel_reponse.dart';
import '../domin/parcel_model.dart';

class ParcelRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, FetchAllParcelResponse>> fetchParcelList({
    ParcelRegularStatus type = ParcelRegularStatus.all,
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
