
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    super.key,
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,
  });

  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  ImageProvider<Object> get imageProvider {
    if (source.startsWith('data:image')) {
      final base64String = source.substring(source.indexOf(',') + 1);
      return MemoryImage(base64Decode(base64String));
    }

    if (source.startsWith('http://') ||
        source.startsWith('https://')) {
      return NetworkImage(source);
    }

    return FileImage(File(source));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image(
        image: imageProvider,
        width: width,
        height: height,
        fit: fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;

          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOut,
            child: child,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: width,
            height: height,
            color: Colors.deepPurple.withOpacity(0.06),
            alignment: Alignment.center,
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                strokeWidth: 2.2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
                color: Colors.deepPurple,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: Colors.deepPurple.withOpacity(0.06),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  size: 34,
                  color: Colors.deepPurple.withOpacity(0.65),
                ),
                const SizedBox(height: 6),
                Text(
                  'تعذّر تحميل الصورة',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
