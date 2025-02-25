import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String name;
  final int index;
  final Function(int)? onTappedRemove;

  const UserWidget({
    super.key,
    required this.name,
    required this.index,
    this.onTappedRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$name ($index)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          IconButton(
            onPressed:
                onTappedRemove != null ? () => onTappedRemove!(index) : null,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
