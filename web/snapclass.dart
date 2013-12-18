library snapclass;

import 'dart:js' show context, JsObject;


class snapclass {

  var Snap;
  var paper;  
  var image;
  var ct = '#svg3025';
  List image_list = [];
  List image_points = ['#starsvg','#path3011','#path3047','#path3079','#path3055','#path3071','#path3063'];
  var image2;
  var pattern;
  
snapclass(List args) {
    
  final Snap = context['Snap'];
  paper = new JsObject(Snap, ['#svg']);
  
  Snap.callMethod('load',['christmas-tree.svg', (e){    
    var tree = e.callMethod('select',[ct]);
    DefineImages(args,e);
    paper.callMethod('prepend',[tree]);
  }]);
}

 void DefineImages(List pasd_list_images,pe){   
   var imageattr = new JsObject.jsify({
     'x':0,
     'y':0,
     'width':175,
     'height':140  
   });
   
   
   for(var i = 0; i< image_points.length; i++){
     if(i < pasd_list_images.length){    
       var temp_ob = paper.callMethod('image',[pasd_list_images[i],0,0,120,120]);       
       var def_temp_ob = temp_ob.callMethod('pattern',[imageattr]).callMethod('toDefs');
       var imagebg = new JsObject.jsify({
         'fill': def_temp_ob
       });
//       pe.callMethod('attr',[imagebg]);
       var selected = pe.callMethod('select',[image_points[i]]);
       selected.callMethod('attr',[imagebg]);
       print(def_temp_ob);
       image_list.add(def_temp_ob);
     }
   }
           
    
 }

 
}