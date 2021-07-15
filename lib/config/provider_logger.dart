import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/config/provider_logger/did_update_provider_model.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final DidUpdateProviderModel didUpdateProviderModel =
        DidUpdateProviderModel(
      provider.name ?? provider.runtimeType.toString(),
      newValue,
    );
    print(didUpdateProviderModel.toJson());
  }
}
