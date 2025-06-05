import 'package:investa4/core/apis/get_category_present.dart';
import 'package:investa4/featurs/dashboard/presentation/widgets/pie_chart_with_legend.dart';

class ManageDashboard {
  List<PieData> pieChartData = [];
  Future init() async {
    await initPieChart();
  }

  Future<void> initPieChart() async {
    Map<String, dynamic>? categoryPercentages =
        await getCategoryPiePercentages() ?? {};
    if (categoryPercentages.isNotEmpty) {
      pieChartData = PieData.fromMap(categoryPercentages);
    }
  }
}
