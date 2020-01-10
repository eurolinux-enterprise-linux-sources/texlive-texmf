Map files for the AMS/Y&Y/Bluesky postscript type 1 fonts (for the
AMS fonts). This file just lists the file names. For use in teTeX's
updmap.cfg, prepend the lines with MixedMap as in the following example:
  MixedMap ams-bsr-interpolated.map

Ok, here comes the listing of the map files:

#####################################################################
ams-bsr.map
ams-bsr-interpolated.map
ams-cmcsc-bsr-interpolated.map
ams-cmex-bsr-interpolated.map
#####################################################################

Possible replacements:

The map files provided here are split up to allow using a different
implementation for some of the fonts provided in this commection.

Replacement 1
=============
For using Latin Modern fonts as "drop in" replacements (version must
be at least 0.98.3) for the AMS/Y&Y/Bluesky postscript type 1 fonts,
you can use the two map files

    cmtext-lm.map
    cmtext-lm-interpolated.map

instead of

    cmtext-bsr.map (from a different package containing the cmps fonts)
    cmtext-bsr-interpolated.map (from a different package containing the
        cmps fonts)
    ams-cmcsc-bsr-interpolated.map

The files define the same fonts, but the implementation will be different.
Use at your own risk.

Replacement 2
=============
Instead of using a down-scaled cmex10 as implementation for cmex7 /
cmex8, you can use an implementation of cmex7 / cmex8 that was obtained
by running textrace.

To do this, use
    ttcmex.map
instead of
    ams-cmex-bsr-interpolated.map
    cmother-bsr-interpolated.map (from a different package containing
        the cmps fonts)

June 2006, Thomas Esser
