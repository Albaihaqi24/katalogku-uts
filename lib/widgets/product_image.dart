import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.url, required this.label});

  final String url;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final placeholder = Center(
      child: Icon(
        Icons.image_not_supported_outlined,
        size: 40,
        color: colors.onSurfaceVariant,
        semanticLabel: 'Gambar tidak tersedia',
      ),
    );
    return ColoredBox(
      color: colors.surfaceContainerLow,
      child: url.isEmpty
          ? placeholder
          : Image.network(
              url,
              fit: BoxFit.contain,
              semanticLabel: label,
              errorBuilder: (context, error, stackTrace) => placeholder,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(
                  child: SizedBox.square(
                    dimension: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
            ),
    );
  }
}
