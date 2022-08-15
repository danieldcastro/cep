import 'package:either_dart/either.dart';

abstract class DeleteFavoriteByIdUsecase {
  Future<Either<Exception, void>> call(int id);
}
