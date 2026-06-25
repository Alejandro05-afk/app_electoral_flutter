import 'dart:io';
import 'package:image/image.dart' as img;

class SharpnessService {
  static const double _threshold = 100.0;

  Future<bool> isSharp(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return false;

    final gray = img.grayscale(image);
    final laplacian = _applyLaplacian(gray);
    final variance = _variance(laplacian);

    return variance >= _threshold;
  }

  List<double> _applyLaplacian(img.Image gray) {
    const kernel = [0, 1, 0, 1, -4, 1, 0, 1, 0];
    final result = <double>[];

    for (int y = 1; y < gray.height - 1; y++) {
      for (int x = 1; x < gray.width - 1; x++) {
        double sum = 0;
        int k = 0;
        for (int dy = -1; dy <= 1; dy++) {
          for (int dx = -1; dx <= 1; dx++) {
            final pixel = gray.getPixel(x + dx, y + dy);
            final luminance = img.getLuminance(pixel);
            sum += luminance * kernel[k++];
          }
        }
        result.add(sum);
      }
    }
    return result;
  }

  double _variance(List<double> values) {
    if (values.isEmpty) return 0;
    final mean = values.reduce((a, b) => a + b) / values.length;
    final sqDiffs = values.map((v) => (v - mean) * (v - mean));
    return sqDiffs.reduce((a, b) => a + b) / values.length;
  }
}
