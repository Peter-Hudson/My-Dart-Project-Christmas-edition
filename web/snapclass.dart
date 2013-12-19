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
   var patternattr = new JsObject.jsify({
     'x':0,
     'y':0,     
     'width':150,
     'height':150,
//     'viewbox': '0 0 150 150',
     'patternUsertUnits': 'objectBoundingBox',
     'preserveAspectRatio': 'xMidYMid slice',     
   });
   
   
   
   
   for(var i = 0; i< image_points.length; i++){
     if(i < pasd_list_images.length){    
       var selected_image = image_points[i];
//       var def_temp_ob = temp_ob.callMethod('pattern',[patternattr]).callMethod('toDefs');
       var imagebg = new JsObject.jsify({
//         'ClipPath': def_temp_ob,
//         'viewbox': '75 75 150 150',
//         'preserveAspectRatio': 'xMaxYMax slice',
//         'transform':'scale(1)',
         'fill':'#000'
       });
//       pe.callMethod('attr',[imagebg]);
       var selected = pe.callMethod('select',[selected_image]);
//       var ppp = selected.callMethod('attr',[imagebg]);
//       var details = ppp.callMethod('attr',['fill']);
//       print(ppp);
       var test = selected.callMethod('getBBox');
       
       var temp_ob = paper.callMethod('image',[pasd_list_images[i]]);
       var imageattr = new JsObject.jsify({ 
//         'x':test['x'],
//         'y':0,
//         'width': 264,
//         'height': 253,
         
         'clip-path': 'url(${selected_image}c)'
           
       });
       
       var newbox = test;
       newbox['clip-path'] = 'url(#starsvgc)';
       temp_ob.callMethod('attr',[imageattr]); 
       temp_ob.callMethod('drag');       
       print(test.runtimeType);
       print(test['width']);
       print(test['vb']);
       print(test['height']);
       print(test['h']);
       print(test['x']);
       print(test['y']);
       print((test['path']));
       
       
       
        
       
       image_list.add(temp_ob);
     }
   }
           
    
 }

 
}