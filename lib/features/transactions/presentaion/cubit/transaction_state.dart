abstract class TransactionStates {}

class IntitialTransactionState extends TransactionStates {}

class GetCategoryLoading extends TransactionStates {}

class GetCategorySucsses extends TransactionStates {}

class GetCategoryError extends TransactionStates {}

class GetCategoryFailed extends TransactionStates {}
class ReturnFundLoading extends TransactionStates {}

class ReturnFundSucsses extends TransactionStates {}

class ReturnFundError extends TransactionStates {}

class ReturnFundFailed extends TransactionStates {}

class GetProductByCategoryDataLoading extends TransactionStates {}

class GetProductByCategoryDataSucsses extends TransactionStates {}

class GetProductByCategoryDataError extends TransactionStates {}

class GetProductByCategoryDataFailed extends TransactionStates {}

class GetProductDetailsLoading extends TransactionStates {}

class GetProductDetailsSucsses extends TransactionStates {}

class GetProductDetailsError extends TransactionStates {}

class GetProductDetailsFailed extends TransactionStates {}

class GetProductImageLoading extends TransactionStates {}

class GetProductImageSucsses extends TransactionStates {}

class GetProductImageError extends TransactionStates {}

class GetProductImageFailed extends TransactionStates {}
