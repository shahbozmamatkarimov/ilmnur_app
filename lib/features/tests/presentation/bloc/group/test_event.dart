part of 'test_bloc.dart';

abstract class TestsEvent extends Equatable {
  const TestsEvent();
}

class GetTests extends TestsEvent {
  @override
  List<Object?> get props => [];
}
