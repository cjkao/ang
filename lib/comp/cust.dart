import 'dart:math' as math;
import 'package:slickdart/slick.dart';
List getData(){
  List _data = [];
     for (var i = 0; i < new math.Random().nextInt(100); i++) {
       _data.add({
         'dtitle': new math.Random().nextInt(100).toString(),
         'duration': new math.Random().nextInt(100).toString(),
         'pc2': new math.Random().nextInt(10) * 100,
         'pc': (new math.Random().nextInt(10) * 100).toString(),
         'YesNo': new math.Random().nextInt(10)>5 ? true: false,
         'Querter': new math.Random().nextInt(3)+1,
         'Querter2': '${new math.Random().nextInt(3)+1}',
         'finish': (new math.Random().nextInt(10) + 10).toString() + "/05/2013",
         'effortDriven': (i % 5 == 0)
       });
     }
     return _data;
}
List<Column> getColDefs(){
  var cols= new ColumnList.fromMap([{
        'name': "Title1",
        'field': "dtitle",
        'sortable': true

      },{
        'width': 80,
        'field': "duration",
        'sortable': true,
        'formatter': LinkFormatter
      },{
        'field': "pc2",
        'sortable': true,
        'editor': 'TextEditor'
      },{
        'field': "finish"
      },{
        'field': "Querter",
        'editor': new SelectListEditor({1:'1',2:'2',3:'3',4:'4'})
      },{
        'field': "Querter2",
        'editor': new SelectListEditor({'1':'1','2':'2','3':'3','4':'4'})
      },{
        'field': "YesNo",
        'editor': 'CheckboxEditor',
        'formatter': CheckmarkFormatter
      },{
        'id': "%_2",
        'field': "pc",
        'editor': 'TextEditor'

      },{
        'field': "effortDriven",
        'width': 300
      }]);
  CheckboxSelectColumn checkboxCol = new CheckboxSelectColumn({
      'cssClass': "slick-cell-checkboxsel"
    });

  cols.insert(0, checkboxCol.getColumnDefinition());
  return cols;
}
LinkFormatter(row, cell, value, columnDef, dataContext) {
  return value!=null ? "<a ng-click='hi' href='#'>z</a>" : "";
}
