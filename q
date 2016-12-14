SYNAPTICS(4)               Kernel Interfaces Manual               SYNAPTICS(4)

NNAAMMEE
       synaptics - touchpad input driver

SSYYNNOOPPSSIISS
       SSeeccttiioonn ""IInnppuuttDDeevviiccee""
         IIddeennttiiffiieerr ""_d_e_v_n_a_m_e""
         DDrriivveerr ""ssyynnaappttiiccss""
         OOppttiioonn ""DDeevviiccee""   ""_d_e_v_p_a_t_h""
         OOppttiioonn ""PPaatthh""     ""_p_a_t_h""
         ...
       EEnnddSSeeccttiioonn

DDEESSCCRRIIPPTTIIOONN
       ssyynnaappttiiccss is an Xorg input driver for touchpads.  Even though touchpads
       can be handled by the normal evdev or mouse drivers, this driver allows
       more  advanced features of the touchpad to become available. Some bene‐
       fits would be:

       ·   Movement with adjustable, non-linear acceleration and speed.

       ·   Button events through short touching of the touchpad.

       ·   Double-Button events through double short touching of the touchpad.

       ·   Dragging through short touching and holding down the finger on  the
           touchpad (tap-and-drag gesture).

       ·   Middle and right button events on the upper and lower corner of the
           touchpad.

       ·   Vertical scrolling (button four and five events) through moving the
           finger on the right side of the touchpad.

       ·   The up/down button sends button four/five events.

       ·   Horizontal  scrolling  (button six and seven events) through moving
           the finger on the lower side of the touchpad.

       ·   The  multi-buttons  send  button  four/five  events  for   vertical
           scrolling and button six/seven events for horizontal scrolling.

       ·   Adjustable finger detection.

       ·   Multifinger  taps: two finger for right button and three finger for
           middle button events.  (Needs hardware  support.   Not  all  models
           implement this feature.)

       ·   Pressure-dependent motion speed.

       Note  that  depending  on the touchpad firmware, some of these features
       might be available even without using the synaptics driver.  Note  also
       that  some  functions are not available on all touchpad models, because
       they need support from  the  touchpad  hardware/firmware.  (Multifinger
       taps for example.)

       The  name  "synaptics"  is historical and the driver still provides the
       synaptics protocol parsing code. Under  Linux  however,  the  hardware-
       specifics  are  handled by the kernel and this driver will work for any
       touchpad that has a working kernel driver. If your device is recognized
       as  "PS/2  Mouse"  or  similar, the kernel driver does not support your
       device and this driver will only provide limited functionality.

CCOONNFFIIGGUURRAATTIIOONN OOPPTTIIOONNSS
       Please refer to xorg.conf(5) for general configuration details and  for
       options  that  can  be  used with all input drivers.  This section only
       covers configuration details specific to this driver.

       The following driver OOppttiioonnss are supported:

       OOppttiioonn ""DDeevviiccee"" ""_s_t_r_i_n_g""
              This option specifies the device file in your  "/dev"  directory
              which  will  be used to access the physical device. Normally you
              should use something like "/dev/input/eventX", where X  is  some
              integer.

       OOppttiioonn ""PPrroottooccooll"" ""_s_t_r_i_n_g""
              Specifies  which kernel driver will be used by this driver. This
              is the list of supported drivers and their default  use  scenar‐
              ios.

              auto-dev   automatic, default (recommend)
              event      Linux 2.6 kernel events
              psaux      raw device access (Linux 2.4)
              psm        FreeBSD psm driver

       OOppttiioonn ""LLeeffttEEddggee"" ""_i_n_t_e_g_e_r""
              X coordinate for left edge. Property: "Synaptics Edges"

       OOppttiioonn ""RRiigghhttEEddggee"" ""_i_n_t_e_g_e_r""
              X coordinate for right edge. Property: "Synaptics Edges"

       OOppttiioonn ""TTooppEEddggee"" ""_i_n_t_e_g_e_r""
              Y coordinate for top edge. Property: "Synaptics Edges"

       OOppttiioonn ""BBoottttoommEEddggee"" ""_i_n_t_e_g_e_r""
              Y coordinate for bottom edge. Property: "Synaptics Edges"

       OOppttiioonn ""FFiinnggeerrLLooww"" ""_i_n_t_e_g_e_r""
              When  finger  pressure drops below this value, the driver counts
              it as a release. Property: "Synaptics Finger"

       OOppttiioonn ""FFiinnggeerrHHiigghh"" ""_i_n_t_e_g_e_r""
              When finger pressure goes above this value, the driver counts it
              as a touch. Property: "Synaptics Finger"

       OOppttiioonn ""MMaaxxTTaappTTiimmee"" ""_i_n_t_e_g_e_r""
              Maximum  time  (in  milliseconds) for detecting a tap. Property:
              "Synaptics Tap Durations"

       OOppttiioonn ""MMaaxxTTaappMMoovvee"" ""_i_n_t_e_g_e_r""
              Maximum movement of the finger for detecting  a  tap.  Property:
              "Synaptics Tap Move"

       OOppttiioonn ""MMaaxxDDoouubblleeTTaappTTiimmee"" ""_i_n_t_e_g_e_r""
              Maximum time (in milliseconds) for detecting a double tap. Prop‐
              erty: "Synaptics Tap Durations"

       OOppttiioonn ""CClliicckkTTiimmee"" ""_i_n_t_e_g_e_r""
              The duration of the mouse click generated by tapping.  Property:
              "Synaptics Tap Durations"

       OOppttiioonn ""CClliicckkPPaadd"" ""_b_o_o_l_e_a_n""
              Whether the device is a click pad. See CClliicckkPPaadd ssuuppppoorrtt for more
              details. Property: "Synaptics ClickPad"

       OOppttiioonn ""VVeerrttEEddggeeSSccrroollll"" ""_b_o_o_l_e_a_n""
              Enable vertical scrolling when dragging along  the  right  edge.
              Property: "Synaptics Edge Scrolling"

       OOppttiioonn ""HHoorriizzEEddggeeSSccrroollll"" ""_b_o_o_l_e_a_n""
              Enable horizontal scrolling when dragging along the bottom edge.
              Property: "Synaptics Edge Scrolling"

       OOppttiioonn ""CCoorrnneerrCCooaassttiinngg"" ""_b_o_o_l_e_a_n""
              Enable edge scrolling to continue while the finger stays  in  an
              edge corner.  Property: "Synaptics Edge Scrolling"

       OOppttiioonn ""VVeerrttTTwwooFFiinnggeerrSSccrroollll"" ""_b_o_o_l_e_a_n""
              Enable  vertical  scrolling  when dragging with two fingers any‐
              where  on  the   touchpad.   Property:   "Synaptics   Two-Finger
              Scrolling"

       OOppttiioonn ""HHoorriizzTTwwooFFiinnggeerrSSccrroollll"" ""_b_o_o_l_e_a_n""
              Enable  horizontal scrolling when dragging with two fingers any‐
              where  on  the   touchpad.   Property:   "Synaptics   Two-Finger
              Scrolling"

       OOppttiioonn ""VVeerrttSSccrroollllDDeellttaa"" ""_i_n_t_e_g_e_r""
              Move  distance  of  the  finger  for  a  scroll event. Property:
              "Synaptics Scrolling Distance"

       OOppttiioonn ""HHoorriizzSSccrroollllDDeellttaa"" ""_i_n_t_e_g_e_r""
              Move distance of  the  finger  for  a  scroll  event.  Property:
              "Synaptics Scrolling Distance"

       OOppttiioonn ""MMiinnSSppeeeedd"" ""_f_l_o_a_t""
              Minimum speed factor. Property: "Synaptics Move Speed"

       OOppttiioonn ""MMaaxxSSppeeeedd"" ""_f_l_o_a_t""
              Maximum speed factor. Property: "Synaptics Move Speed"

       OOppttiioonn ""AAcccceellFFaaccttoorr"" ""_f_l_o_a_t""
              Acceleration  factor  for  normal  pointer  movements. Property:
              "Synaptics Move Speed"

       OOppttiioonn ""PPrreessssuurreeMMoottiioonnMMiinnZZ"" ""_i_n_t_e_g_e_r""
              Finger pressure at  which  minimum  pressure  motion  factor  is
              applied. Property: "Synaptics Pressure Motion"

       OOppttiioonn ""PPrreessssuurreeMMoottiioonnMMaaxxZZ"" ""_i_n_t_e_g_e_r""
              Finger  pressure  at  which  maximum  pressure  motion factor is
              applied.  Property: "Synaptics Pressure Motion"

       OOppttiioonn ""PPrreessssuurreeMMoottiioonnMMiinnFFaaccttoorr"" ""_i_n_t_e_g_e_r""
              Lowest setting for pressure motion factor. Property:  "Synaptics
              Pressure Motion Factor"

       OOppttiioonn ""PPrreessssuurreeMMoottiioonnMMaaxxFFaaccttoorr"" ""_i_n_t_e_g_e_r""
              Greatest  setting  for pressure motion factor. Property: "Synap‐
              tics Pressure Motion Factor"

       OOppttiioonn ""HHoorriizzHHyysstteerreessiiss"" ""_i_n_t_e_g_e_r""
              The minimum horizontal HW distance required to  generate  motion
              events.  Can  be  specified  as  a percentage. Increase if noise
              motion is a problem for you. Zero  is  disabled.   Default:  0.5
              percent  of  the  diagonal or (in case of evdev) the appropriate
              "fuzz" as advertised by the device.

       OOppttiioonn ""VVeerrttHHyysstteerreessiiss"" ""_i_n_t_e_g_e_r""
              The minimum vertical HW distance  required  to  generate  motion
              events. See HHoorriizzHHyysstteerreessiiss.

       OOppttiioonn ""UUppDDoowwnnSSccrroolllliinngg"" ""_b_o_o_l_e_a_n""
              If  on, the up/down buttons generate button 4/5 events.  If off,
              the up button generates a double click and the down button  gen‐
              erates  a  button  2  event.  This  option is only available for
              touchpads with physical scroll  buttons.   Property:  "Synaptics
              Button Scrolling"

       OOppttiioonn ""LLeeffttRRiigghhttSSccrroolllliinngg"" ""_b_o_o_l_e_a_n""
              If  on,  the  left/right buttons generate button 6/7 events.  If
              off, the left/right buttons both generate button 2 events.  This
              option is only available for touchpads with physical scroll but‐
              tons.  Property: "Synaptics Button Scrolling"

       OOppttiioonn ""UUppDDoowwnnSSccrroollllRReeppeeaatt"" ""_b_o_o_l_e_a_n""
              If on, and the up/down buttons are used for  scrolling  (UUppDDoowwnn‐‐
              SSccrroolllliinngg),  these  buttons will send auto-repeating 4/5 events,
              with the delay between repeats determined by SSccrroollllBBuuttttoonnRReeppeeaatt.
              This option is only available for touchpads with physical scroll
              buttons.  Property: "Synaptics Button Scrolling Repeat"

       OOppttiioonn ""LLeeffttRRiigghhttSSccrroollllRReeppeeaatt"" ""_b_o_o_l_e_a_n""
              If on, and the left/right buttons are used for scrolling  (LLeefftt‐‐
              RRiigghhttSSccrroolllliinngg),  these  buttons  will  send  auto-repeating 6/7
              events, with the delay between repeats determined by  SSccrroollllBBuutt‐‐
              ttoonnRReeppeeaatt.   This  option  is  only available for touchpads with
              physical scroll buttons.  Property: "Synaptics Button  Scrolling
              Repeat"

       OOppttiioonn ""SSccrroollllBBuuttttoonnRReeppeeaatt"" ""_i_n_t_e_g_e_r""
              The  number of milliseconds between repeats of button events 4-7
              from the up/down/left/right scroll buttons.  This option is only
              available for touchpads with physical scroll buttons.  Property:
              "Synaptics Button Scrolling Time"

       OOppttiioonn ""EEmmuullaatteeMMiiddBBuuttttoonnTTiimmee"" ""_i_n_t_e_g_e_r""
              Maximum time (in  milliseconds)  for  middle  button  emulation.
              Property: "Synaptics Middle Button Timeout"

       OOppttiioonn ""EEmmuullaatteeTTwwooFFiinnggeerrMMiinnZZ"" ""_i_n_t_e_g_e_r""
              For  touchpads not capable of detecting multiple fingers but are
              capable of detecting finger pressure and width, this sets the  Z
              pressure threshold.  When both Z pressure and W width thresholds
              are crossed, a two finger press will be emulated. This  defaults
              to  a  value that disables emulation on touchpads with real two-
              finger detection and defaults to a value that enables  emulation
              on  remaining touchpads that support pressure and width support.
              Property: "Synaptics Two-Finger Pressure"

       OOppttiioonn ""EEmmuullaatteeTTwwooFFiinnggeerrMMiinnWW"" ""_i_n_t_e_g_e_r""
              For touchpads not capable of detecting multiple fingers but  are
              capable  of detecting finger width and pressure, this sets the W
              width threshold.  When both W width and  Z  pressure  thresholds
              are  crossed,  a two finger press will be emulated. This feature
              works best with (PPaallmmDDeetteecctt) off. Property: "Synaptics  Two-Fin‐
              ger Width"

       OOppttiioonn ""TToouucchhppaaddOOffff"" ""_i_n_t_e_g_e_r""
              Switch off the touchpad.  Valid values are:

              0   Touchpad is enabled
              1   Touchpad is switched off (physical clicks still work)
              2   Only tapping and scrolling is switched off
              When  the  touchpad  is  switched off, button events caused by a
              physical button press are still interpreted. On a ClickPad, this
              includes  software-emulated  middle and right buttons as defined
              by the SoftButtonAreas setting.

       Property: "Synaptics Off"

       OOppttiioonn ""LLoocckkeeddDDrraaggss"" ""_b_o_o_l_e_a_n""
              If off, a tap-and-drag gesture ends when you release the finger.
              If  on,  the  gesture  is active until you tap a second time, or
              until LockedDragTimeout  expires.  Property:  "Synaptics  Locked
              Drags"

       OOppttiioonn ""LLoocckkeeddDDrraaggTTiimmeeoouutt"" ""_i_n_t_e_g_e_r""
              This parameter specifies how long it takes (in milliseconds) for
              the LockedDrags mode to be automatically turned  off  after  the
              finger  is  released  from  the  touchpad.  Property: "Synaptics
              Locked Drags Timeout"

       OOppttiioonn ""RRTTCCoorrnneerrBBuuttttoonn"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported on a right top corner  tap.   Set
              to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""RRBBCCoorrnneerrBBuuttttoonn"" ""_i_n_t_e_g_e_r""
              Which  mouse  button  is  reported on a right bottom corner tap.
              Set to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""LLTTCCoorrnneerrBBuuttttoonn"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported on a left top corner tap.  Set to
              0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""LLBBCCoorrnneerrBBuuttttoonn"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported on a left bottom corner tap.  Set
              to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""TTaappBBuuttttoonn11"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported on a non-corner  one-finger  tap.
              Set to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""TTaappBBuuttttoonn22"" ""_i_n_t_e_g_e_r""
              Which  mouse  button is reported on a non-corner two-finger tap.
              Set to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""TTaappBBuuttttoonn33"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported on a non-corner three-finger tap.
              Set to 0 to disable. Property: "Synaptics Tap Action"

       OOppttiioonn ""CClliicckkFFiinnggeerr11"" ""_i_n_t_e_g_e_r""
              Which  mouse button is reported when left-clicking with one fin‐
              ger.  Set to 0 to disable. Property: "Synaptics Click Action"

       OOppttiioonn ""CClliicckkFFiinnggeerr22"" ""_i_n_t_e_g_e_r""
              Which mouse button is reported when left-clicking with two  fin‐
              gers.  Set to 0 to disable. Property: "Synaptics Click Action"

       OOppttiioonn ""CClliicckkFFiinnggeerr33"" ""_i_n_t_e_g_e_r""
              Which  mouse  button  is  reported when left-clicking with three
              fingers.  Set  to  0  to  disable.  Property:  "Synaptics  Click
              Action"

       OOppttiioonn ""CCiirrccuullaarrSSccrroolllliinngg"" ""_b_o_o_l_e_a_n""
              If on, circular scrolling is used. Property: "Synaptics Circular
              Scrolling"

       OOppttiioonn ""CCiirrccSSccrroollllDDeellttaa"" ""_f_l_o_a_t""
              Move angle (radians) of finger to generate a scroll event. Prop‐
              erty: "Synaptics Circular Scrolling Distance"

       OOppttiioonn ""CCiirrccSSccrroollllTTrriiggggeerr"" ""_i_n_t_e_g_e_r""
              Trigger region on the touchpad to start circular scrolling

              0   All Edges
              1   Top Edge
              2   Top Right Corner
              3   Right Edge
              4   Bottom Right Corner
              5   Bottom Edge
              6   Bottom Left Corner

              7   Left Edge
              8   Top Left Corner
              Property: "Synaptics Circular Scrolling Trigger"

       OOppttiioonn ""CCiirrccuullaarrPPaadd"" ""_b_o_o_l_e_a_n""
              Instead  of  being a rectangle, the edge is the ellipse enclosed
              by  the  Left/Right/Top/BottomEdge  parameters.   For   circular
              touchpads. Property: "Synaptics Circular Pad"

       OOppttiioonn ""PPaallmmDDeetteecctt"" ""_b_o_o_l_e_a_n""
              If  palm  detection  should  be  enabled.   Note  that this also
              requires hardware/firmware support from the touchpad.  Property:
              "Synaptics Palm Detection"

       OOppttiioonn ""PPaallmmMMiinnWWiiddtthh"" ""_i_n_t_e_g_e_r""
              Minimum  finger width at which touch is considered a palm. Prop‐
              erty: "Synaptics Palm Dimensions"

       OOppttiioonn ""PPaallmmMMiinnZZ"" ""_i_n_t_e_g_e_r""
              Minimum finger pressure at which touch  is  considered  a  palm.
              Property: "Synaptics Palm Dimensions"

       OOppttiioonn ""CCooaassttiinnggSSppeeeedd"" ""_f_l_o_a_t""
              Your  finger  needs  to  produce this many scrolls per second in
              order to start coasting.  The default is 20 which should prevent
              you  from  starting coasting unintentionally.  0 disables coast‐
              ing. Property: "Synaptics Coasting Speed"

       OOppttiioonn ""CCooaassttiinnggFFrriiccttiioonn"" ""_f_l_o_a_t""
              Number  of  scrolls/second²  to  decrease  the  coasting  speed.
              Default is 50.  Property: "Synaptics Coasting Speed"

       OOppttiioonn ""SSiinngglleeTTaappTTiimmeeoouutt"" ""_i_n_t_e_g_e_r""
              Timeout  after  a tap to recognize it as a single tap. Property:
              "Synaptics Tap Durations"

       OOppttiioonn ""GGrraabbEEvveennttDDeevviiccee"" ""_b_o_o_l_e_a_n""
              If GrabEventDevice is true,  the  driver  will  grab  the  event
              device  for  exclusive use when using the linux 2.6 event proto‐
              col.  When using other protocols, this  option  has  no  effect.
              Grabbing the event device means that no other user space or ker‐
              nel space program sees the touchpad events.  This  is  desirable
              if  the  X  config  file  includes  /dev/input/mice  as an input
              device, but is undesirable if you want  to  monitor  the  device
              from  user  space.   When  changing this parameter with the syn‐
              client program, the change will not take effect until the synap‐
              tics  driver is disabled and reenabled.  This can be achieved by
              switching to a text console and then switching back to X.

       OOppttiioonn ""TTaappAAnnddDDrraaggGGeessttuurree"" ""_b_o_o_l_e_a_n""
              Switch on/off the tap-and-drag  gesture.   This  gesture  is  an
              alternative way of dragging.  It is performed by tapping (touch‐
              ing and releasing the finger), then touching  again  and  moving
              the  finger  on the touchpad.  The gesture is enabled by default
              and can be disabled by setting the TapAndDragGesture  option  to
              false. Property: "Synaptics Gestures"

       OOppttiioonn
              ®esolutionDetect"  ""  boolean  " Allow or prevent the synaptics
              driver from reporting the size of the touchpad to the X  server.
              The  X  server normally uses this information to scale movements
              so that touchpad movement corresponds visually to  mouse  cursor
              movements  on the screen.  However, in some rare cases where the
              touchpad height/width ratio is significantly different from  the
              laptop, it can cause the mouse cursor to skip pixels in the X or
              Y axis.  This option allows  disabling  this  scaling  behavior,
              which  can provide smoother mouse movement in such cases.  Prop‐
              erty: "Synaptics Resolution Detect"

       OOppttiioonn ""VVeerrttRReessoolluuttiioonn"" ""_i_n_t_e_g_e_r""
              Resolution of X coordinates in units/millimeter.  The  value  is
              used  together with HorizResolution to compensate unequal verti‐
              cal  and  horizontal  sensitivity.  Setting  VertResolution  and
              HorizResolution  equal  values  means  no  compensation. Default
              value is read from the touchpad or set to 1 if value  could  not
              be read.  Property: "Synaptics Pad Resolution"

       OOppttiioonn ""HHoorriizzRReessoolluuttiioonn"" ""_i_n_t_e_g_e_r""
              Resolution  of  Y  coordinates in units/millimeter. The value is
              used together with VertResolution to compensate unequal vertical
              and horizontal sensitivity. Setting VertResolution and HorizRes‐
              olution equal values means no  compensation.  Default  value  is
              read  from  the touchpad or set to 1 if value could not be read.
              Property: "Synaptics Pad Resolution"

       OOppttiioonn ""AArreeaaLLeeffttEEddggee"" ""_i_n_t_e_g_e_r""
              Ignore movements, scrolling and tapping which start left of this
              edge.   The  option is disabled by default and can be enabled by
              setting the AreaLeftEdge option to any integer value other  than
              zero.  If  supported  by the server (version 1.9 and later), the
              edge may be specified in percent  of  the  total  width  of  the
              touchpad. Property: "Synaptics Area"

       OOppttiioonn ""AArreeaaRRiigghhttEEddggee"" ""_i_n_t_e_g_e_r""
              Ignore  movements,  scrolling  and  tapping which start right of
              this edge.  The option is disabled by default and can be enabled
              by  setting  the AreaRightEdge option to any integer value other
              than zero. If supported by the server (version 1.9  and  later),
              the  edge  may be specified in percent of the total width of the
              touchpad. Property: "Synaptics Area"

       OOppttiioonn ""AArreeaaTTooppEEddggee"" ""_i_n_t_e_g_e_r""
              Ignore movements, scrolling and tapping which start  above  this
              edge.   The  option is disabled by default and can be enabled by
              setting the AreaTopEdge option to any integer value  other  than
              zero.  If  supported  by the server (version 1.9 and later), the
              edge may be specified in percent of  the  total  height  of  the
              touchpad. Property: "Synaptics Area"

       OOppttiioonn ""AArreeaaBBoottttoommEEddggee"" ""_i_n_t_e_g_e_r""
              Ignore  movements,  scrolling and tapping which start below this
              edge.  The option is disabled by default and can be  enabled  by
              setting  the  AreaBottomEdge  option  to any integer value other
              than zero. If supported by the server (version 1.9  and  later),
              the  edge may be specified in percent of the total height of the
              touchpad. Property: "Synaptics Area"

       OOppttiioonn ""SSooffttBBuuttttoonnAArreeaass"" ""_R_B_L _R_B_R _R_B_T _R_B_B _M_B_L _M_B_R _M_B_T _M_B_B""
              This option is only available on ClickPad devices.  Enable  soft
              button  click  area support on ClickPad devices.  The first four
              parameters are the left, right, top, bottom edge  of  the  right
              button,  respectively,  the second four parameters are the left,
              right, top, bottom edge of the middle button, respectively.  Any
              of  the  values may be given as percentage of the touchpad width
              or height, whichever applies.  If any edge is set to 0 (not 0%),
              the  button is assumed to extend to infinity in the given direc‐
              tion. Setting all values to 0  (not  0%)  disables  soft  button
              areas. Button areas may not overlap, however it is permitted for
              two buttons to share an edge value.  Property:  "Synaptics  Soft
              Button Areas"

       OOppttiioonn ""HHaassSSeeccoonnddaarryySSooffttBBuuttttoonnss"" ""_b_o_o_l_e_a_n""
              This  option  is only available on ClickPad devices.  Enable the
              secondary software button area support. The exact area  must  be
              set  in option "SecondarySoftButtonAreas".  See CClliicckkPPaadd ssuuppppoorrtt
              for more details.

       OOppttiioonn ""SSeeccoonnddaarryySSooffttBBuuttttoonnAArreeaass"" ""_R_B_L _R_B_R _R_B_T _R_B_B _M_B_L _M_B_R _M_B_T _M_B_B""
              This option is only available on ClickPad devices  and  only  if
              OOppttiioonn  ""HHaassSSeeccoonnddaarryySSooffttBBuuttttoonnss""  is  enabled.  Define the sec‐
              ondary soft button click areas on ClickPad devices  (usually  on
              top of the device).  For the allowed values for this option, see
              OOppttiioonn ""SSooffttBBuuttttoonnAArreeaass""..  Primary  and  secondary  soft  button
              areas  must  not overlap each other. If they do, the behavior of
              the driver is undefined.  Property:  "Synaptics  Secondary  Soft
              Button Areas". This property is only initialized if OOppttiioonn ""HHaass‐‐
              SSeeccoonnddaarryySSooffttBBuuttttoonnss"" is enabled and this option is set  in  the
              xorg.conf(5).

CCOONNFFIIGGUURRAATTIIOONN DDEETTAAIILLSS
   AArreeaa hhaannddlliinngg
       The  LeftEdge, RightEdge, TopEdge and BottomEdge parameters are used to
       define the edge and corner areas of the touchpad.  The parameters split
       the touchpad area in 9 pieces, like this:
             │             │
             │ LeftEdge    │ RightEdge
       ┌─────└─────────────└───┐ Physical top edge
       │ 1   │      2      │ 3 │
       └─────└─────────────└───┘ TopEdge
       │     │             │   │
       │ 4   │      5      │ 6 │
       │     │             │   │
       └─────└─────────────└───┘ BottomEdge
       │ 7   │      8      │ 9 │
       └─────└─────────────└───┘ Physical bottom edge
       │Physical left edge     │ Physical right edge

       Coordinates to the left of LeftEdge are part of the left edge (areas 1,
       4 and 7), coordinates to the left of LeftEdge and above  TopEdge  (area
       1) are part of the upper left corner, etc.

       A  good  way to find appropriate edge parameters is to use evtest(1) on
       the device to see the x/y coordinates corresponding to different  posi‐
       tions on the touchpad.

       The  perceived  physical  edges  may be adjusted with the AreaLeftEdge,
       AreaRightEdge, AreaTopEdge, and AreaBottomEdge options. If these values
       are  set  to something other than the physical edges, input that starts
       in the space between the area edge and the respective physical edge  is
       ignored.  Note that this reduces the available space on the touchpad to
       start motions in.

   TTaappppiinngg
       A tap event happens when the finger is touched and released in  a  time
       interval shorter than MaxTapTime, and the touch and release coordinates
       are less than MaxTapMove units apart.  A "touch" event happens when the
       Z  value goes above FingerHigh, and an "untouch" event happens when the
       Z value goes below FingerLow.

       The MaxDoubleTapTime parameter has the same function as the  MaxTapTime
       parameter,  but  for  the second, third, etc tap in a tap sequence.  If
       you can't perform double clicks fast enough (for example, xmms  depends
       on  fast double clicks), try reducing this parameter.  If you can't get
       word selection to work in xterm (ie  button  down,  button  up,  button
       down, move mouse), try increasing this parameter.

       The  ClickTime parameter controls the delay between the button down and
       button up X events generated in response to a tap event.   A  too  long
       value  can  cause undesirable autorepeat in scroll bars and a too small
       value means that visual feedback  from  the  gui  application  you  are
       interacting  with  is  harder  to  see.  For this parameter to have any
       effect, "FastTaps" has to be disabled.

   AAcccceelleerraattiioonn
       The MinSpeed, MaxSpeed and AccelFactor parameters control  the  pointer
       motion  speed.   The  speed  value defines the scaling between touchpad
       coordinates and  screen  coordinates.   When  moving  the  finger  very
       slowly,  the MinSpeed value is used, when moving very fast the MaxSpeed
       value is used.  When moving the finger at moderate  speed,  you  get  a
       pointer  motion  speed somewhere between MinSpeed and MaxSpeed.  If you
       don't want any acceleration, set MinSpeed  and  MaxSpeed  to  the  same
       value.

       The MinSpeed, MaxSpeed and AccelFactor parameters don't have any effect
       on scrolling speed.  Scrolling speed  is  determined  solely  from  the
       VertScrollDelta  and HorizScrollDelta parameters.  To invert the direc‐
       tion of  vertical  or  horizontal  scrolling,  set  VertScrollDelta  or
       HorizScrollDelta to a negative value.

       Acceleration is mostly handled outside the driver, thus the driver will
       translate MinSpeed into constant deceleration  and  adapt  MaxSpeed  at
       startup  time.  This  ensures  you can user the other acceleration pro‐
       files, albeit without pressure motion. However the numbers  at  runtime
       will likely be different from any options you may have set.

   PPrreessssuurree mmoottiioonn
       When  pressure  motion is activated, the cursor motion speed depends on
       the pressure exerted on the touchpad (the more pressure exerted on  the
       touchpad,  the  faster the pointer).  More precisely the speed is first
       calculated according to MinSpeed, MaxSpeed and AccelFactor, and then is
       multiplied by a sensitivity factor.

       The sensitivity factor can be adjusted using the PressureMotion parame‐
       ters.  If the pressure is below PressureMotionMinZ,  PressureMotionMin‐
       Factor is used, and if the pressure is greater than PressureMotionMaxZ,
       PressureMotionMaxFactor is used.  For a pressure  value  between  Pres‐
       sureMotionMinZ  and  PressureMotionMaxZ,  the  factor is increased lin‐
       early.

   MMiiddddllee bbuuttttoonn eemmuullaattiioonn
       Since most synaptics touchpad models don't have a  button  that  corre‐
       sponds  to  the middle button on a mouse, the driver can emulate middle
       mouse button events.  If you press both the left and right  mouse  but‐
       tons  at  almost  the same time (no more than EmulateMidButtonTime mil‐
       liseconds apart) the driver generates a middle mouse button event.

   CCiirrccuullaarr ssccrroolllliinngg
       Circular scrolling  acts  like  a  scrolling  wheel  on  the  touchpad.
       Scrolling  is engaged when a drag starts in the given CircScrollTrigger
       region, which can be all edges, a particular side, or a particular cor‐
       ner.   Once  scrolling is engaged, moving your finger in clockwise cir‐
       cles around the center of the touchpad will generate scroll down events
       and  counter  clockwise motion will generate scroll up events.  Lifting
       your finger will disengage circular scrolling.  Use tight circles  near
       the  center  of the pad for fast scrolling and large circles for better
       control.  When used together with vertical scrolling, hitting the upper
       or lower right corner will seamlessly switch over from vertical to cir‐
       cular scrolling.

   CCooaassttiinngg
       Coasting is enabled by setting the CoastingSpeed parameter  to  a  non-
       zero  value.   Coasting comes in two flavors: conventional (finger off)
       coasting, and corner (finger on) coasting.

       Conventional coasting is enabled when coasting is enabled, and  Corner‐
       Coasting is set to false.  When conventional coasting is enabled, hori‐
       zontal/vertical scrolling can continue after  the  finger  is  released
       from  the  lower/right  edge  of the touchpad.  The driver computes the
       scrolling speed corresponding to the finger  speed  immediately  before
       the finger leaves the touchpad.  If this scrolling speed is larger than
       the CoastingSpeed parameter (measured in scroll events per second), the
       scrolling will continue with the same speed in the same direction until
       the finger touches the touchpad again.

       Corner coasting is enabled when coasting is enabled, and CornerCoasting
       is  set  to  true.  When corner coasting is enabled, edge scrolling can
       continue as long as the finger stays in a corner.  Coasting begins when
       the finger enters the corner, and continues until the finger leaves the
       corner.  CornerCoasting takes precedence over the seamless switch  from
       edge  scrolling  to  circular scrolling.  That is, if CornerCoasting is
       active, scrolling will stop, and circular  scrolling  will  not  start,
       when the finger leaves the corner.

   NNooiissee ccaanncceellllaattiioonn
       The  synaptics  has  a built-in noise cancellation based on hysteresis.
       This means that incoming coordinates actually shift a box of predefined
       dimensions  such  that  it covers the incoming coordinate, and only the
       boxes own center is used as input. Obviously, the smaller the  box  the
       better,  but  the  likelyhood  of  noise  motion  coming  through  also
       increases.

   CClliicckkPPaadd ssuuppppoorrtt
       A click pad device has button(s) integrated into the touchpad  surface.
       The  user  must  press downward on the touchpad in order to generated a
       button press. ClickPad support is enabled if the option CClliicckkPPaadd is set
       or  the property is set at runtime. On some platforms, this option will
       be set automatically if the kernel detects a matching device. On Linux,
       the device must have the INPUT_PROP_BUTTONPAD property set.

       ClickPads  do  not  support  middle mouse button emulation. If enabling
       ClickPad support at runime, the user must also  set  the  middle  mouse
       button timeout to 0. If auto-detected, middle mouse button emulation is
       disabled by the driver.

       ClickPads provide software emulated buttons  through  OOppttiioonn  ""SSooffttBBuutt‐‐
       ttoonnAArreeaass""..   These  buttons  enable areas on the touchpad to perform as
       right or middle mouse button. When the user performs a click  within  a
       defined soft button area, a right or middle click is performed.

       Some  laptops, most notably the Lenovo T440, T540 and x240 series, pro‐
       vide a pointing stick without physical buttons. On those  laptops,  the
       top  of  the  touchpad acts as software-emulated button area. This area
       can be enabled with  OOppttiioonn  ""HHaassSSeeccoonnddaarryySSooffttBBuuttttoonnss""  and  configured
       with OOppttiioonn ""SSeeccoonnddaarryySSooffttBBuuttttoonnAArreeaass""..  On some platforms, this option
       will be set automatically if the kernel detects a matching  device.  On
       Linux, the device must have the INPUT_PROP_TOPBUTTONPAD property set.

DDEEVVIICCEE PPRROOPPEERRTTIIEESS
       Synaptics  1.0 and higher support input device properties if the driver
       is running on X server 1.6 or higher. The synclient tool  shipped  with
       synaptics version 1.1 uses input device properties by default.  Proper‐
       ties supported:

       SSyynnaappttiiccss EEddggeess
              32 bit, 4 values, left, right, top, bottom.

       SSyynnaappttiiccss FFiinnggeerr
              32 bit, 3 values, low, high, press.

       SSyynnaappttiiccss TTaapp TTiimmee
              32 bit.

       SSyynnaappttiiccss TTaapp MMoovvee
              32 bit.

       SSyynnaappttiiccss TTaapp DDuurraattiioonnss
              32 bit, 3 values, single touch timeout,  max  tapping  time  for
              double taps, duration of a single click.

       SSyynnaappttiiccss CClliicckkPPaadd
              8 bit (Bool).

       SSyynnaappttiiccss MMiiddddllee BBuuttttoonn TTiimmeeoouutt
              32 bit.

       SSyynnaappttiiccss TTwwoo--FFiinnggeerr PPrreessssuurree
              32 bit.

       SSyynnaappttiiccss TTwwoo--FFiinnggeerr WWiiddtthh
              32 bit.

       SSyynnaappttiiccss SSccrroolllliinngg DDiissttaannccee
              32 bit, 2 values, vert, horiz.

       SSyynnaappttiiccss EEddggee SSccrroolllliinngg
              8 bit (BOOL), 3 values, vertical, horizontal, corner.

       SSyynnaappttiiccss TTwwoo--FFiinnggeerr SSccrroolllliinngg
              8 bit (BOOL), 2 values, vertical, horizontal.

       SSyynnaappttiiccss MMoovvee SSppeeeedd
              FLOAT, 4 values, min, max, accel, <deprecated>

       SSyynnaappttiiccss BBuuttttoonn SSccrroolllliinngg
              8 bit (BOOL), 2 values, updown, leftright.

       SSyynnaappttiiccss BBuuttttoonn SSccrroolllliinngg RReeppeeaatt
              8 bit (BOOL), 2 values, updown, leftright.

       SSyynnaappttiiccss BBuuttttoonn SSccrroolllliinngg TTiimmee
              32 bit.

       SSyynnaappttiiccss OOffff
              8 bit, valid values (0, 1, 2).

       SSyynnaappttiiccss LLoocckkeedd DDrraaggss
              8 bit (BOOL).

       SSyynnaappttiiccss LLoocckkeedd DDrraaggss TTiimmeeoouutt
              32 bit.

       SSyynnaappttiiccss TTaapp AAccttiioonn
              8  bit,  up  to  MAX_TAP values (see synaptics.h), 0 disables an
              element. order: RT, RB, LT, LB, F1, F2, F3.

       SSyynnaappttiiccss CClliicckk AAccttiioonn
              8 bit, up to MAX_CLICK values (see synaptics.h), 0  disables  an
              element.  order: Finger 1, 2, 3.

       SSyynnaappttiiccss CCiirrccuullaarr SSccrroolllliinngg
              8 bit (BOOL).

       SSyynnaappttiiccss CCiirrccuullaarr SSccrroolllliinngg DDiissttaannccee
              FLOAT.

       SSyynnaappttiiccss CCiirrccuullaarr SSccrroolllliinngg TTrriiggggeerr
              8 bit, valid values 0..8 (inclusive) order: any edge, top, top +
              right, right, right + bottom, bottom, bottom + left, left,  left
              + top.

       SSyynnaappttiiccss CCiirrccuullaarr PPaadd
              8 bit (BOOL).

       SSyynnaappttiiccss PPaallmm DDeetteeccttiioonn
              8 bit (BOOL).

       SSyynnaappttiiccss PPaallmm DDiimmeennssiioonnss
              32 bit, 2 values, width, z.

       SSyynnaappttiiccss CCooaassttiinngg SSppeeeedd
              FLOAT, 2 values, speed, friction.

       SSyynnaappttiiccss PPrreessssuurree MMoottiioonn
              32 bit, 2 values, min, max.

       SSyynnaappttiiccss PPrreessssuurree MMoottiioonn FFaaccttoorr
              FLOAT, 2 values, min, max.

       SSyynnaappttiiccss RReessoolluuttiioonn DDeetteecctt
              8 bit (BOOL).

       SSyynnaappttiiccss GGrraabb EEvveenntt DDeevviiccee
              8 bit (BOOL).

       SSyynnaappttiiccss GGeessttuurreess
              8 bit (BOOL), 1 value, tap-and-drag.

       SSyynnaappttiiccss AArreeaa
              The  AreaLeftEdge, AreaRightEdge, AreaTopEdge and AreaBottomEdge
              parameters are used to define the edges of the  active  area  of
              the  touchpad.  All  movements, scrolling and tapping which take
              place outside of this area will be  ignored.  This  property  is
              disabled by default.

              32  bit,  4 values, left, right, top, bottom. 0 disables an ele‐
              ment.

       SSyynnaappttiiccss SSoofftt BBuuttttoonn AArreeaass
              This property is only available on ClickPad devices.  The  Right
              and  middle soft button areas are used to support right and mid‐
              dle click actions on a ClickPad device. Providing 0 for all val‐
              ues of a given button disables the button area.

              32 bit, 8 values, RBL, RBR, RBT, RBB, MBL, MBR, MBT, MBB.

       SSyynnaappttiiccss CCaappaabbiilliittiieess
              This read-only property expresses the physical capability of the
              touchpad, most notably whether the  touchpad  hardware  supports
              multi-finger tapping and scrolling.

              8  bit (BOOL), 7 values (read-only), has left button, has middle
              button, has right  button,  two-finger  detection,  three-finger
              detection, pressure detection, and finger/palm width detection.

       SSyynnaappttiiccss PPaadd RReessoolluuttiioonn
              32  bit  unsigned, 2 values (read-only), vertical, horizontal in
              units/millimeter.

NNOOTTEESS
       Configuration through _I_n_p_u_t_C_l_a_s_s sections is recommended in  X  servers
       1.8  and  later.  See  xorg.conf.d(5)  for  more  details.  An  example
       xorg.conf.d snippet is provided in _$_{_s_o_u_r_c_e_c_o_d_e_}_/_c_o_n_f_/_5_0_-_s_y_n_a_p_t_i_c_s_._c_o_n_f

       Configuration through hal fdi files is recommended in  X  servers  1.5,
       1.6  and  1.7.  An  example  hal  policy  file is provided in _$_{_s_o_u_r_c_e_‐
       _c_o_d_e_}_/_c_o_n_f_/_1_1_-_x_1_1_-_s_y_n_a_p_t_i_c_s_._f_d_i

       If either of PPrroottooccooll ""_a_u_t_o_-_d_e_v"" (default) or PPrroottooccooll ""_e_v_e_n_t"" is used,
       the  driver  initializes defaults based on the capabilities reported by
       the kernel driver. Acceleration, edges and resolution are based on  the
       dimensions  reported  by the kernel. If the kernel reports multi-finger
       detection, two-finger vertical scrolling is  enabled,  horizontal  two-
       finger  scrolling  is  disabled  and  edge scrolling is disabled. If no
       multi-finger capabilities are reported, edge scrolling is  enabled  for
       both horizontal and vertical scrolling.  Tapping is disabled by default
       for touchpads with one or more physical buttons.  To enable it you need
       to  map  tap actions to buttons. See the "TapButton1", "TapButton2" and
       "TapButton3" options.

       Button mapping for physical buttons is handled in the server.   If  the
       device  is  switched  to  left-handed (an in-server mapping of physical
       buttons 1, 2, 3 to the logical buttons 3,  2,  1,  respectively),  both
       physical  and  TapButtons are affected. To counteract this, the TapBut‐
       tons need to be set up in reverse order (TapButton1=3, TapButton2=1).

RREEMMOOVVEEDD OOPPTTIIOONNSS
       The following options are no longer part of the driver configuration:

       OOppttiioonn ""RReeppeeaatteerr"" ""_s_t_r_i_n_g""

       OOppttiioonn ""HHiissttoorryySSiizzee"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""SSppeecciiaallSSccrroollllAArreeaaRRiigghhtt"" ""_b_o_o_l_e_a_n""

       OOppttiioonn ""GGuueessttMMoouusseeOOffff"" ""_b_o_o_l_e_a_n""

       OOppttiioonn ""SSHHMMCCoonnffiigg"" ""_b_o_o_l_e_a_n""

       OOppttiioonn ""FFiinnggeerrPPrreessss"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""TTrraacckkssttiicckkSSppeeeedd"" ""_f_l_o_a_t""

       OOppttiioonn ""FFaassttTTaappss"" ""_b_o_o_l_e_a_n""

       OOppttiioonn ""EEddggeeMMoottiioonnMMiinnZZ"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""EEddggeeMMoottiioonnMMaaxxZZ"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""EEddggeeMMoottiioonnMMiinnSSppeeeedd"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""EEddggeeMMoottiioonnMMaaxxSSppeeeedd"" ""_i_n_t_e_g_e_r""

       OOppttiioonn ""EEddggeeMMoottiioonnUUsseeAAllwwaayyss"" ""_b_o_o_l_e_a_n""

       AAUUTTHHOORRSS

       Peter Osterlund <petero2@telia.com> and many others.

SSEEEE AALLSSOO
       Xorg(1), xorg.conf(5), Xserver(1), X(7), synclient(1), syndaemon(1)

X Version 11              xf86-input-synaptics 1.8.2              SYNAPTICS(4)
