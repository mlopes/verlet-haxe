package org.mlopes.verlerTest;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import org.mlopes.verler.VerlerPoint;

class VerlerPointTest
{
	private var point:VerlerPoint;


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
		point = new VerlerPoint(10, 15);
	}

	@After
	public function tearDown():Void
	{
	}

	@Test
	public function itCreatesPointWithXAndYPosition():Void
	{
		Assert.areSame(10, point.getX());
		Assert.areSame(15, point.getY());
	}

	@Test
	public function itUpdatesXAndYWhenNewPositionIsSet():Void
	{
		point.setPosition(20, 25);

		Assert.areSame(20, point.getX());
		Assert.areSame(25, point.getY());
	}

	@Test
	public function itSetsPreviousXAndYWhenItIsCreated():Void
	{
		Assert.areSame(10, point.getPreviousX());
		Assert.areSame(15, point.getPreviousY());
	}

	@Test
	public function itSetsPreviousXAndYWhenXAndYAreSet():Void
	{
		point.setPosition(20, 25);

		Assert.areSame(20, point.getPreviousX());
		Assert.areSame(25, point.getPreviousY());
	}

	@Test
	public function itSetsX():Void
	{
		point.setX(15);

		Assert.areSame(15, point.getX());
	}

	@Test
	public function itSetsY():Void
	{
		point.setY(25);

		Assert.areSame(25, point.getY());
	}

	@Test
	public function itDoesNotSetPreviousXWhenSettingX():Void
	{
		point.setX(15);

		Assert.areSame(10, point.getPreviousX());
	}

	@Test
	public function itDoesNotSetPreviousYWhenSettingY():Void
	{
		point.setY(25);

		Assert.areSame(15, point.getPreviousY());
	}

	@Test
	public function itSetsXtoXPlusXPlusPreviousXWhenUpdated():Void
	{
		point.setX(15);

	 	var x:Float = point.getX();
	 	var previousX:Float = point.getPreviousX();

		point.update();
	 	Assert.areSame((x + x) - previousX, point.getX());
	}

	@Test
	public function itSetsYtoYPlusYPlusPreviousYWhenUpdated():Void
	{
		point.setY(25);

	 	var y:Float = point.getY();
	 	var previousY:Float = point.getPreviousY();

		point.update();
	 	Assert.areSame((y + y) - previousY, point.getY());
	}

	@Test
	public function itSetsPreviousXtoTheOriginalValueOfX():Void
	{
		point.setX(15);

		var x:Float = point.getX();

		point.update();
		Assert.areSame(x, point.getPreviousX());
	}

	@Test
	public function itSetsPreviousYtoTheOriginalValueOfY():Void
	{
		point.setY(25);

		var y:Float = point.getY();

		point.update();
		Assert.areSame(y, point.getPreviousY());
	}
	// @Test
	// public function itAppliesThePhysicsFormulaWhenUpdating():Void
	// {
	// 	var x:Int = point.getX();
	// 	var y:Int = point.getY();
	// 	var previousX:Int = point.getPreviousX();
	// 	var previousY:Int = point.getPreviousY();

	// 	point.update();

	// 	Assert.areSame((x + x) - previousX, point.getX());
	// 	Assert.areSame((y + y) - previousY, point.getY());
	// }
}