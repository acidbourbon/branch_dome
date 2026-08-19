
d = 500;
dome_radius = 50;
dome_thickness = 1.5;
image_scale = 5;

module image(){
  import(file = "branch_dome.svg", center = true, dpi = 96*1/image_scale);
}



module rays(){
  color("red") 
  translate([0,0,d])
  rotate([180,0,0])
  linear_extrude(height = d, scale = 0.005)
    image();

}

module shadow(){
  
  color("black") translate([0,0,d]) rotate([180,0,0]) image();
}


module dome(dome_radius,dome_thickness){
  color("blue")
  intersection(){
    translate([0,0,dome_radius]) cube(dome_radius*2,center=true);
    difference(){
      sphere(dome_radius);
      sphere(dome_radius-dome_thickness);
    }
  }
}

module image_dome(){
 difference(){   

   dome(dome_radius,dome_thickness);

   rays();
 } 
}

module n_image_dome(){
 intersection(){   

   dome(dome_radius,dome_thickness);

   rays();
 } 
}


module dome_base(height){
    color("green")
    difference(){
    dome(dome_radius,dome_thickness);
    translate([0,0,dome_radius+height]) cube(dome_radius*2,center=true);
    }    
        
}

//shadow();
//rays();
//image_dome();
dome_base(15);
n_image_dome();




