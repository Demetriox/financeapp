import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesRangeAnnotationChart extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool? animate;

  const TimeSeriesRangeAnnotationChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesRangeAnnotationChart.withSampleData(data) {
    return TimeSeriesRangeAnnotationChart(
      _createSampleData(data),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(seriesList, animate: animate, behaviors: [
      charts.RangeAnnotation([
        charts.RangeAnnotationSegment(
            seriesList[0].data[0].time,
            seriesList[0].data[seriesList[0].data.length - 1].time,
            charts.RangeAnnotationAxisType.domain),
      ]),
    ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      data) {
    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
