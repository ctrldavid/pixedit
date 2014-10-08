Pixedit
====

Pixel editor!
-------------

run with `flora --port=3007 -f public`




Ramblings:

API layout
/pe/users/[id] -> user info
/pe/users/[id]/projects/
/pe/users/[id]/projects/[id]/sprites/
/pe/users/[id]/projects/[id]/frames/
/pe/users/[id]/projects/[id]/animations/

sprite:{
  image: <base64>
  centre: {x,y}
  layers: {
    name: <base64>
    ...
  }
  locations: {
    name: {x,y}
    ...
  }
  metadata: {
    name: whatever
    ...
  }
}

frame:{
  sprites:{
    name:{
      spriteid: [id]
      attachtype: 'none'|'sprite'|'frame'
      attachtargetid: [id]
      attachtargetpoint: named location
      attachlocalpoint: named location
    }
  }
}


Sprites: Basically images but with metadata and layers.
  ideas for layers: 
    team coloured sections:
      Layer will adjust the colour slightly. midpoint is 127,127,127 which means 0 adjustments
      r: adjust hue (0 -> -180, 127 -> 0, 255 -> +180)
      g: adjust saturation      
      b: adjust luminosity
    lighting maps like in https://www.kickstarter.com/projects/finnmorgan/sprite-lamp-dynamic-lighting-for-2d-art

  mount points / attachment points / named locations
    These will be kinda important for composing sprites to create frames
    stuff like 'weapon mount 1' or 'head' or 'eyes'

Frames: One or more sprites layered together. 
  sprites should be connected by attachment points.
  may need a 'centre' as well for aligning frames in an animation.
  should have its own named points too for things that move around the scene


Animations: One or more frames played after each other.
  Contains variables that are passed down to frames and then to sprites.
  things like 'team colour'
  or 'light colour'
  or lighting direction or whatever. just named vars.

Projects: like folders, (heirarchical?) contains animations, frames and sprites.



Important features:
Frame overlaying for animation. 
  (If you're working a sprite for frame 2 you should have frame 1 visible 'underneath')
  complicated because you draw sprites but animate frames...
  might be nice to work on a sprite and display the full frame underneath.
    (eg a chicken running around a barn, working on chicken, but can see the
     whole barn and barrels and stuff. The path could be premade on the frame; 
     for example there is a 'chicken' named location in the frame that the chicken
     attaches to.)
  should have a shortcut to quickly play through the animation up to the frame you're
  currently working on.

