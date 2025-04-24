import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:whisprr_mobile/features/authentication/data/bloc/segment/segment_bloc.dart';

@injectable
class ListenSegmentStreamUsecase {
  ListenSegmentStreamUsecase({
    required this.segmentBloc,
  });

  final SegmentBloc segmentBloc;

  void execute(BuildContext context) {
    segmentBloc.add(SegmentEvent.listenSegmentStream(context: context));
  }
}
