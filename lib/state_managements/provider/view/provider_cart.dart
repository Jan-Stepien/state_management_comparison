import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_comparison/state_managements/provider/provider.dart';

class ProviderCart extends StatelessWidget {
  const ProviderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) => Scaffold(
        appBar: AppBar(
          title: Text('Total: ${cart.totalPrice}'),
        ),
        body: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(cart.items[index].productName ?? ''),
          ),
        ),
      ),
    );
  }
}
