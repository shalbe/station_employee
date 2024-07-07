abstract class RegisterStates {}

class RegisterInstialState extends RegisterStates {}

class UploadImage extends RegisterStates {}

class UploadImageError extends RegisterStates {}

class RegisterLoading extends RegisterStates {}

class RegisterSuccess extends RegisterStates {
  String? message;
  RegisterSuccess(this.message);
}

class RegisterError extends RegisterStates {}

class GetCityLoading extends RegisterStates {}

class GetCitySuccess extends RegisterStates {}

class GetCityError extends RegisterStates {}

class GetCityFailed extends RegisterStates {}

class GetShopsLoading extends RegisterStates {}

class GetShopsSuccess extends RegisterStates {}

class GetShopsError extends RegisterStates {}

class GetShopsFailed extends RegisterStates {}
