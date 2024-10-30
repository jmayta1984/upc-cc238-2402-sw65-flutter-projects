import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/favorites/data/local/favorite_model.dart';

class FavoriteListItem extends StatefulWidget {
  const FavoriteListItem({super.key, required this.favorite, required this.onDelete});
  final FavoriteModel favorite;
  final Function() onDelete; 

  @override
  State<FavoriteListItem> createState() => _FavoriteListItemState();
}

class _FavoriteListItemState extends State<FavoriteListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.favorite.image,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.favorite.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.favorite.species)
              ],
            ),
          ),
          const Spacer(),
          IconButton.outlined(
              onPressed: () {
                widget.onDelete();

              }, icon: const Icon(Icons.delete_outline))
        ],
      ),
    );
  }
}
