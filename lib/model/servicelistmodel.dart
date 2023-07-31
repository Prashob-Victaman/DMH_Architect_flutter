List modelNameList = [
  'FloorPlan',
  'StructuralDrawing',
  'ThreeDFrontElevation',
  'TwoDFrontElevation',
  'ThreeDFloorPlan',
  'WorkingDrawing',
  'ElectricalPlan',
  'PlumbingPlan',
  'WalkthoughVideo',
  'SiteSupervision',
  'NakshaLayout'
];

class ServiceListModel {
  Map FloorPlan;
  Map StructuralDrawing;
  Map ThreeDFrontElevation;
  Map TwoDFrontElevation;
  Map ThreeDFloorPlan;
  Map WorkingDrawing;
  Map ElectricalPlan;
  Map PlumbingPlan;
  Map WalkthoughVideo;
  Map SiteSupervision;
  Map NakshaLayout;

  ServiceListModel(
      {required this.FloorPlan,
      required this.StructuralDrawing,
      required this.TwoDFrontElevation,
      required this.ThreeDFrontElevation,
      required this.ThreeDFloorPlan,
      required this.WorkingDrawing,
      required this.ElectricalPlan,
      required this.WalkthoughVideo,
      required this.PlumbingPlan,
      required this.SiteSupervision,
      required this.NakshaLayout
      });

  factory ServiceListModel.fromJson(json) => ServiceListModel(
        ThreeDFrontElevation: json['3D Front Elevation'],
        StructuralDrawing: json['Structural Drawing'],
        FloorPlan: json['Floor Plan'],
        TwoDFrontElevation: json['2D Front Elevation'],
        ThreeDFloorPlan: json['3D Floor Plan'],
        WorkingDrawing: json['Working Drawing'],
        ElectricalPlan: json['Electrical Plan'],
        WalkthoughVideo: json['Walkthough Video'],
        PlumbingPlan: json['Plumbing Plan'],
        SiteSupervision: json['Site Supervision'],
        NakshaLayout: json['Naksha Layout'],
      );
}
