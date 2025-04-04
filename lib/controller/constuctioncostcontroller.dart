import 'package:get/get.dart';


class CostCalculatorController extends GetxController {
  var builtUpArea = 0.0.obs;
  var costPerSqFt = 0.0.obs;
  var totalCost = 0.0.obs;

  void calculateTotalCost() {
    totalCost.value = builtUpArea.value * costPerSqFt.value;
  }

  Map<String, double> getCostBreakdown() {
    return {
      "Cement (16.4%)": totalCost.value * 0.164,
      "Sand (12.3%)": totalCost.value * 0.123,
      "Aggregate (7.4%)": totalCost.value * 0.074,
      "Steel (24.6%)": totalCost.value * 0.246,
      "Finishers (16.5%)": totalCost.value * 0.165,
      "Paint (4.1%) + Tiles (8.0%) + Bricks (4.4%)": totalCost.value * (0.041 + 0.08 + 0.044),
      "Fittings (22.8%)": totalCost.value * 0.228,
      "Window (3.0%) + Doors (3.4%) + Plumbing (5.5%) + Electrical (6.8%) + Sanitary (4.1%)": totalCost.value * (0.03 + 0.034 + 0.055 + 0.068 + 0.041),
    };
  }

  Map<String, String> getMaterialQuantities() {
    double ratio = builtUpArea.value / 2000.0;
    return {
      "Cement": "${(800.0 * ratio).toStringAsFixed(2)} Bags",
      "Sand": "${(1632.0 * ratio).toStringAsFixed(2)} Ton",
      "Aggregate": "${(1216.0 * ratio).toStringAsFixed(2)} Ton",
      "Steel": "${(8000.0 * ratio).toStringAsFixed(2)} Kg.",
      "Paint": "${(360.0 * ratio).toStringAsFixed(2)} lt",
      "Brick": "${(16000.0 * ratio).toStringAsFixed(2)} Pcs.",
      "Flooring": "${(2600.0 * ratio).toStringAsFixed(2)} ft2",
    };
  }
}