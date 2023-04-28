import '../../core/util/global_validation_map_function.dart';

class RemoteErrorModel {
  String error;
  RemoteErrorModel({
    required this.error,
  });

  factory RemoteErrorModel.fromJson(Map<String, dynamic> map) =>
      GlobalValidationMapFunction.checkMap(
              keys: ['erro'], map: map, className: 'RemoteErrorModel')
          ? RemoteErrorModel(
              error: map['erro'] as String,
            )
          : RemoteErrorModel.empty();

  factory RemoteErrorModel.empty() {
    return RemoteErrorModel(
      error: '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemoteErrorModel && other.error == error;
  }

  @override
  int get hashCode {
    return error.hashCode;
  }

  @override
  String toString() {
    return 'RemoteErrorModel{error: $error}';
  }
}
