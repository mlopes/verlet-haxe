package org.mlopes.verlerTest;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import nme.geom.Point;
import org.mlopes.verler.VerletVector;
import org.mlopes.verler.VerlerPoint;

class VerletVectorTest
{


	public function new()
	{

	}

	@BeforeClass
	public function beforeClass():Void
	{
	}

	@AfterClass
	public function afterClass():Void
	{
	}

	@Before
	public function setup():Void
	{
	}

	@After
	public function tearDown():Void
	{
	}

	@Test
	public function itSetsVectorLengthWhenItIsCreated():Void
	{
		var pointA:VerlerPoint = new VerlerPoint(10, 10);
		var pointB:VerlerPoint = new VerlerPoint(20, 20);

		var vector:VerletVector = new VerletVector(
			pointA,
			pointB);

		Assert.areSame(Point.distance(pointA, pointB) , vector.getLength());
	}
}