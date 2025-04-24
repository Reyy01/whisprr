import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/segment/segment_bloc.dart';

@injectable
class DisposeSegmentListenerUsecase {
  DisposeSegmentListenerUsecase({
    required this.segmentBloc,
  });

  final SegmentBloc segmentBloc;

  void execute() {
    segmentBloc.add(const SegmentEvent.disposeSegmentListener());
  }
}
