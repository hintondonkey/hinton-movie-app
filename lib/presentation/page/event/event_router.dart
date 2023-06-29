import 'package:flutter/material.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/navigator/page_navigator.dart';
import 'package:movie_app/presentation/page/event/index.dart';
import 'package:movie_app/presentation/page/event_detail/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

class EventRouter with BaseRouter {
  @override
  onNavigateByState(
      {required BuildContext context, required BaseState state}) {}

  @override
  onNavigateByEvent({required BuildContext context, required BaseEvent event}) {
    if (event is NavigateEventDetailScreen) {
      navigator.materialPush(
          context: context,
          page: EventDetailPage(
            pageTag: PageTag.eventDetail,
            eventId: event.eventId,
          ));
    }
  }
}
