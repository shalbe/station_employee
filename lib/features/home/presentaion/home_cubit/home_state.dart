abstract class HomeState {}

class IntitialHomeStates extends HomeState {}

class GetUserDataLoading extends HomeState {}

class GetUserDataSucsses extends HomeState {}

class GetUserDataError extends HomeState {}

class GetPendingWithDrawLoading extends HomeState {}

class GetPendingWithDrawSucsses extends HomeState {}

class GetPendingWithDrawError extends HomeState {}

class GetAcceptedWithDrawLoading extends HomeState {}

class GetAcceptedWithDrawSucsses extends HomeState {}

class GetAcceptedWithDrawError extends HomeState {}

class GetSettingsDataLoading extends HomeState {}

class GetSettingsDataSucsses extends HomeState {}

class GetSettingsDataError extends HomeState {}

class GetUserDataFailed extends HomeState {}

class ReturnFundLoading extends HomeState {}

class ReturnFundSucsses extends HomeState {}

class ReturnFundError extends HomeState {}

class ReturnFundFailed extends HomeState {}

class GetTotalShopSalesLoading extends HomeState {}

class GetTotalShopSalesSucsses extends HomeState {}

class GetTotalShopSalesError extends HomeState {}

class GetTotalShopSalesFailed extends HomeState {}

class GetCategoryLoading extends HomeState {}

class GetCategorySucsses extends HomeState {}

class GetCategoryError extends HomeState {}

class GetCategoryFailed extends HomeState {}

class GetlatestMessageLoading extends HomeState {}

class GetlatestMessageSucsses extends HomeState {}

class GetlatestMessageError extends HomeState {}

class GetAllMessageLoading extends HomeState {}

class GetAllMessageSucsses extends HomeState {}

class GetAllMessageError extends HomeState {}

class GetCashOrderLoading extends HomeState {}

class GetCashOrderSucsses extends HomeState {}

class GetCashOrderError extends HomeState {}

class GetDebitOrderLoading extends HomeState {}

class GetDebitOrderSucsses extends HomeState {}

class GetDebitOrderError extends HomeState {}

class GetClientCarLoading extends HomeState {}

class GetClientCarSucsses extends HomeState {}

class GetClientCarError extends HomeState {}

class GetTopSalesFailed extends HomeState {}

class GetCompanyLoading extends HomeState {}

class GetCompanySucsses extends HomeState {}

class GetCompanyError extends HomeState {}

class GetCompanyFailed extends HomeState {}

class ScanByIdLoading extends HomeState {}

class ScanByIdSucsses extends HomeState {}

class ScanByIdError extends HomeState {}

class CarNumberLoading extends HomeState {}

class CarNumberSucsses extends HomeState {}

class CarNumberError extends HomeState {}

class CarNumberDebitLoading extends HomeState {}

class CarNumberDebitSucsses extends HomeState {}

class CarNumberDebitError extends HomeState {}

class CarNumberSellDebitLoading extends HomeState {}

class CarNumberSellDebitSucsses extends HomeState {}

class CarNumberSellDebitError extends HomeState {}

class CarCreditDebitLoading extends HomeState {}

class CarCreditDebitSucsses extends HomeState {}

class CarCreditDebitError extends HomeState {}

class GetMaterialsLoading extends HomeState {}

class GetMaterialsSuccess extends HomeState {}

class GetMaterialsError extends HomeState {}

class SendCarNumberLoading extends HomeState {}

class SendCarNumberSucsses extends HomeState {}

class SendCarNumberError extends HomeState {}

class ScanByIdFailed extends HomeState {}

class AddFundLoading extends HomeState {}

class AddFundSucsses extends HomeState {}

class AddFundError extends HomeState {}

class AddFundFailed extends HomeState {}

class GetPartenerLoading extends HomeState {}

class GetPartenerSucsses extends HomeState {}

class GetPartenerError extends HomeState {}

class GetPartenerFailed extends HomeState {}

class GetOrderCountLoading extends HomeState {}

class GetOrderCountSucsess extends HomeState {}

class GetOrderCountError extends HomeState {}

class GetOrderCountfailed extends HomeState {}

class GetOrderDataLoading extends HomeState {}

class GetOrderDataSucsess extends HomeState {}

class GetOrderDataError extends HomeState {}

class GetOrderDataFailed extends HomeState {}

class GetPaidOrderDataLoading extends HomeState {}

class GetPaidOrderDataSucsess extends HomeState {}

class GetPaidOrderDataError extends HomeState {}

class GetPaidOrderDataFailed extends HomeState {}

class GetUnPaidOrderDataLoading extends HomeState {}

class GetUnPaidOrderDataSucsess extends HomeState {}

class GetUnPaidOrderDataError extends HomeState {}

class GetUnPaidOrderDataFailed extends HomeState {}

class LogoutLoading extends HomeState {}

class LogoutSucsess extends HomeState {}

class LogoutError extends HomeState {}

class LogoutFailed extends HomeState {}

class CrateSuggestLoading extends HomeState {}

class CrateSuggestSucsess extends HomeState {
  String? message;
  CrateSuggestSucsess(this.message);
}

class CrateSuggestError extends HomeState {}

class CrateSuggestFailed extends HomeState {}
