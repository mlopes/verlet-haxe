package org.mlopes.verler;

import org.mlopes.verler.VerlerPoint;

class VerletVector
{
    private var length:Float;

    public function new(pointA:VerlerPoint, pointB:VerlerPoint)
    {
        var dX:Float = pointA.getX() - pointB.getX();
        var dY:Float = pointA.getY() - pointB.getY();
        length = Math.sqrt((dX * dX) + (dY * dY));
    }

    public function getLength():Float
    {
        return length;
    }
}