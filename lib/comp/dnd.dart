import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:async';
import 'package:dnd/dnd.dart';
/**
 *
 */
@Component(
    selector: '[dnd-card]',
      template:
'''
    <div class='card' >{{seq}}</div>
''',
    cssUrl: 'dnd.css'
      ,
    useShadowDom: false
    )
class Card{
  @NgOneWay('data-seq')
  int seq;

}


@Component(
    selector: 'dnd-book',
    template: '''
<div class='container'>
<div class='row'>
  <div class='col-md-3 dropzone'>
    <div dnd-card ng-repeat='item in list' data-seq='item'></div>
  </div>
  <div class='col-md-3'>
    <button ng-click='move()'>hi</button>
  </div>
</div>
</div>
''' ,
    cssUrl: const ['dnd.css','https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css']
,
  useShadowDom: false
)
class Book{
  bool hide=true;
  Scope scope;
  List list=[1,2,3,4,5,6,7,8];
  ShadowRoot _shadowRoot;
  Dropzone dropzone;
  Draggable draggable;
//  void onShadowRoot(ShadowRoot shadowRoot){
//    _shadowRoot=shadowRoot;
//
//    draggable= new Draggable(shadowRoot.querySelectorAll('dnd-card')
//        ,avatarHandler: new AvatarHandler.original(), verticalOnly:true);
//     dropzone = new Dropzone(shadowRoot.querySelectorAll('dnd-card'));
////     shadowRoot.host.addEventListener("_customDrop", (_){  //_customDragOver
////       //var dd= _ as DropzoneEvent;
////       print(list.length);
////     });
//    dropzone.onDrop.listen((DropzoneEvent event) {
//      //  event.draggableElement.remove();
////      var z=event.draggableElement.text;
////      var comp=ngProbe(event.draggableElement).directives.first;
////
////      print('data: ${event.draggableElement.dataset['seq']}');
//////        list.remove(comp.seq);
//
//      swapElements(event.draggableElement, event.dropzoneElement);
//    });
//  }


  void swapElements(Element elm1, Element elm2) {
    var parent1 = elm1.parent;
     var next1   = elm1.nextElementSibling;
     var parent2 = elm2.parent;
     var next2   = elm2.nextElementSibling;

     parent1.insertBefore(elm2, next1);
     parent2.insertBefore(elm1, next2);
//    var comp=ngProbe(elm1).directives.first.seq;
//    var comp2=ngProbe(elm2).directives.first.seq;
//    int idx1=list.indexOf(comp);
//    int idx2=list.indexOf(comp2);
//    list[idx1]=comp2;
//    list[idx2]=comp;
  }



  void handleClick($event){
    print($event);
  }
  void handlePress($event){
      print($event);
  }
  attach(){


  }

  move(){
    draggable= new Draggable(querySelectorAll('[dnd-card]')
               ,avatarHandler: new AvatarHandler.original(), verticalOnly:true);
        dropzone = new Dropzone(querySelectorAll('[dnd-card]'));
        dropzone.onDrop.listen((DropzoneEvent event) {
         swapElements(event.draggableElement, event.dropzoneElement);
        });
  }
}


