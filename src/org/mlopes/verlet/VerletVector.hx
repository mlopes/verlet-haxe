package org.mlopes.verlet;

import org.mlopes.verlet.VerletPoint;

class VerletVector
{
    private var length:Float;

    public function new(pointA:VerletPoint, pointB:VerletPoint)
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