import 'package:ilmnur_app/features/reyting/data/models/reyting.dart';
import 'package:ilmnur_app/core/resources/data_state.dart';

abstract class ReytingRepo {
  Future<DataState<Reyting>> getReyting(int id);
}
