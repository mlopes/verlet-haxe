package org.mlopes.verlet;

import openfl.geom.Point;

class VerletPoint extends Point
{
    private var previousX:Float;
    private var previousY:Float;
    private var falldownRate:Float = 0;

    public function new(newX:Float, newY:Float)
    {
        super(newX, newY);
        setPosition(newX, newY);
    }

    public function getX():Float
    {
        return x;
    }

    public function setX(newX:Float):Void
    {
        x = newX;
    }

    public function getY():Float
    {
        return y;
    }

    public function setY(newY:Float):Void
    {
        y = newY;
    }

    public function getPreviousX():Float
    {
        return previousX;
    }

    public function getPreviousY():Float
    {
        return previousY;
    }

    public function setFalldownRate(rate:Float):Void
    {
        falldownRate = rate;
    }

    public function setPosition(newX:Float, newY:Float):Void
    {
        x = previousX = newX;
        y = previousY = newY;
    }

    public function update():Void
    {
        updateYFalldown();

        var originalX:Float = x;
        var originalY:Float = y;

        x += x - previousX;
        y += y - previousY;

        previousX = originalX;
        previousY = originalY;
    }

    private function updateYFalldown():Void
    {
        y += falldownRate;
    }
}
