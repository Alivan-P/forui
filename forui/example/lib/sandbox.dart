import 'package:flutter/material.dart';

import 'package:forui/forui.dart';
import 'package:forui/src/widgets/toast/toast.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  int pages = 10;
  PageController controller = PageController();
  late FPaginationController paginationController = FPaginationController(pages: pages);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = PageStorage.maybeOf(context)?.readState(context) ?? 0;
    paginationController.page = value;
  }

  void _handlePageChanged() {
    if (!controller.hasClients) {
      return;
    }
    final page = paginationController.page;
    final old = controller.page?.round();
    if (old case final old when old != page) {
      if (page == old! + 1 || page == old - 1) {
        controller.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      } else {
        controller.jumpToPage(page);
      }
    }
  }

  Widget buildToast(BuildContext context, ToastOverlay overlay) =>
      FCard(title: Text('Event has been created'), subtitle: Text('Sunday, July 07, 2024 at 12:00 PM'));

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 10,
    children: [
      SizedBox(
        height: 300,
        width: 300,
        child: NotificationListener(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (controller.hasClients) {
                paginationController.page = controller.page!.round();
                return true;
              }
            }
            return false;
          },
          child: PageView.builder(
            itemCount: pages,
            controller: controller,
            itemBuilder:
                (context, index) => ColoredBox(
                  color: index.isEven ? Colors.red : Colors.blue,
                  child: Center(child: Text('Page $index', style: const TextStyle(fontSize: 45, color: Colors.white))),
                ),
          ),
        ),
      ),
      SizedBox(height: 200, child: FPagination(controller: paginationController, onChange: _handlePageChanged)),

      FButton(
        child: const Text('bottom left'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.bottomLeft);
        },
      ),
      FButton(
        child: const Text('bottom center'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.bottomCenter);
        },
      ),
      FButton(
        child: const Text('bottom right'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.bottomRight);
        },
      ),

      FButton(
        child: const Text('top left'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.topLeft);
        },
      ),
      FButton(
        child: const Text('top center'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.topCenter);
        },
      ),
      FButton(
        child: const Text('top right'),
        onPress: () {
          showToast(context: context, builder: buildToast, location: ToastLocation.topRight);
        },
      ),
    ],
  );

  @override
  void dispose() {
    paginationController.dispose();
    controller.dispose();
    super.dispose();
  }
}
