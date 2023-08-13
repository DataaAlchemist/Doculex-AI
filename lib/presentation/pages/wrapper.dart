import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/authentication/authentication_notifier.dart';
import 'landing/landing_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationNotifier);

    return Scaffold(
      body: state.when(
        unauthenticated: () {
          return const LandingPage();
        },
        authenticated: () {
          return const Center(
            child: Text('Authenticated'),
          );
        },
      ),
    );
  }
}
