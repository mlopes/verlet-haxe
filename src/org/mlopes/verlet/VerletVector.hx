package org.mlopes.verlet;

import nme.geom.Point;
import org.mlopes.verlet.VerletPoint;

class VerletVector
{
    private var length:Float;
    private var pointA:VerletPoint;
    private var pointB:VerletPoint;
    private var rigidity:Float = 0.5;

    public function new(pointA_:VerletPoint, pointB_:VerletPoint)
    {
        pointA = pointA_;
        pointB = pointB_;
        length = Point.distance(pointA, pointB);
    }

    public function getLength():Float
    {
        return length;
    }

    public function constrain():Void
    {
        var currentLenght:Float = Point.distance(pointB, pointA);

        var offsetX:Float = offsetProportionalToVariationInLength(pointB.x, pointA.x, currentLenght);
        var offsetY:Float = offsetProportionalToVariationInLength(pointB.y, pointA.y, currentLenght);

        pointA.x -= offsetX;
        pointA.y -= offsetY;
        pointB.x += offsetX;
        pointB.y += offsetY;
    }

    private function offsetProportionalToVariationInLength(
        coordinateB:Float, coordinateA:Float, currentLenght:Float):Float
    {
        var coordinateDifference:Float = coordinateB - coordinateA;
        var lengthDifference:Float = length - currentLenght;

        return (lengthDifference * (coordinateDifference/currentLenght)) * rigidity;
    }

    public function setRigidity(newRigidity:Float):Void
    {
        rigidity = newRigidity;
    }

    public function getPointA():VerletPoint
    {
        return pointA;
    }

    public function getPointB():VerletPoint
    {
        return pointB;
    }

}