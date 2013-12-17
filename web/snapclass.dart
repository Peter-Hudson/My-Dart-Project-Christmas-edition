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

  void oldFunc(){
    Snap.callMethod('load',['christmas-tree.svg', (e){
      var tree = e.callMethod('select',['#svg3025']);
      var star = e.callMethod('select',['#starsvg']);
      var ballball1 = e.callMethod('select',['#path3063']);
  //    Snap.callMethod('load',['star.svg',(f){
  //      var sg = f.callMethod('select',['#svg2']);
        image = paper.callMethod('image',['https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/c210.0.540.540/s200x200/1468585_10151831930897423_1727857692_n.jpg',232,0,220,220]);
  //      image.callMethod('drag',[]);
        var scoped = new JsObject.jsify({
  //        'cx':100,
  //        'cy':100,
  //        'mask':image,
          'fill': "r()#fef",
  //          'opacity': 0.9
        });
        
  
        var yy = [1100,100];
        var ppp = new JsObject.jsify({
          'mask':star,
          'fill':'none',
  //        'transform':'t{$yy}'
        });
        
        image2 = paper.callMethod('image',['https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/c210.0.540.540/s200x200/1468585_10151831930897423_1727857692_n.jpg',0,0,110,110]);
        var imageattr = new JsObject.jsify({
          'x':0,
          'y':0,
          'width':175,
          'height':140  
        });
        var imagepattern = image2.callMethod('pattern',[imageattr]); 
        var defimage = imagepattern.callMethod('toDefs');      
        var ppp2 = new JsObject.jsify({
  //        'mask':ballball1,
  //        'fill':'url(https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc3/c210.0.540.540/s50x50/1468585_10151831930897423_1727857692_n.jpg)',
  //        'fill': "r()#fef"
            'fill': defimage
  //        'transform':'t{$yy}'
        });
        image.callMethod('attr',[ppp]);
        var rep = ballball1.callMethod('attr',[ppp2]);
        star.callMethod('attr',[scoped]);
  
      paper.callMethod('prepend',[tree]);
    }]);
  
    
    
      
  }

}