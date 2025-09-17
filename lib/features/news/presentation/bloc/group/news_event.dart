part of 'news_bloc.dart';

abstract class ReytingEvent extends Equatable {
  const ReytingEvent();
}

class GetReytings extends ReytingEvent {
  @override
  List<Object?> get props => [];
}
