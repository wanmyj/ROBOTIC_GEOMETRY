function bPa0=findbPa0(rab,aPb0)
%this func is used to find the coord of point A0 at Coord B when the coord
%of A0 in Coord A is known
bPa0=-rab'*aPb0;