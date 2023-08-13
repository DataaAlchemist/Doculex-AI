import 'package:doculex_ai/presentation/notifiers/authentication/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authenticationNotifier);

    return const Scaffold(
      body: Center(
        child: Text('asdasd'),
      ),
    );

    return Scaffold(
      body: state.when(
        unauthenticated: () {
          return const Center(
            child: Text('Unauthenticated'),
          );
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
