part of 'information_bloc.dart';

@immutable
class InformationState {
  List<Product> products;
  Product? currentProduct;

  InformationState({ this.products=const [],this.currentProduct});

  InformationState copyWith({
    List<Product>? products,
    Product? currentProduct
  }) {
    return InformationState(
      products: products ?? this.products,
      currentProduct: currentProduct?? this.currentProduct
    );
  }
}


