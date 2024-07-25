part of 'information_bloc.dart';

@immutable
abstract class InformationEvent {}

class LoadDataEvent extends InformationEvent {
   final BuildContext? context;

   LoadDataEvent(this.context);
}

class ChangeCurrentProductEvent extends InformationEvent {
   final Product product;

   ChangeCurrentProductEvent(this.product);
}