import 'package:flutter/material.dart';

class ShadImage extends StatelessWidget {
  const ShadImage({
    super.key,
    this.asset,
    this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });
  final String? asset;
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    assert(asset != null || url != null, 'Provide either asset or url.');
    assert(asset == null || url == null, 'Provide only one image source.');
    return asset != null
        ? Image.asset(asset!, width: width, height: height, fit: fit)
        : Image.network(url!, width: width, height: height, fit: fit);
  }
}
