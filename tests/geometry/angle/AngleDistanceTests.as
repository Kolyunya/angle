package kolyunya.tests.geometry.angle 
{
	
	import asunit.framework.TestCase;
	import asunit.framework.Assert;
	import kolyunya.geometry.Angle;
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class AngleDistanceTests extends TestCase
	{
		
		public function AngleDistanceTests(test:String)
		{
			super(test);
		}
		
		public function test001():void
		{
			var foo:Angle = new Angle(Math.PI / 4);
			var bar:Angle = new Angle(Math.PI / 2);
			var distanceExpected:Number = new Angle(Math.PI / 4).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}
		
		public function test002():void
		{
			var foo:Angle = new Angle(Math.PI / 4);
			var bar:Angle = new Angle(Math.PI / 4 * 3);
			var distanceExpected:Number = new Angle(Math.PI / 2).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}
		
		public function test003():void
		{
			var foo:Angle = new Angle(Math.PI / 4);
			var bar:Angle = new Angle(-Math.PI / 4);
			var distanceExpected:Number = new Angle(Math.PI / 2).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}
			
		public function test004():void
		{
			var foo:Angle = new Angle(Math.PI);
			var bar:Angle = new Angle(0);
			var distanceExpected:Number = new Angle(Math.PI).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}		
		
		public function test005():void
		{
			var foo:Angle = new Angle(Math.PI - Math.PI / 10);
			var bar:Angle = new Angle(-Math.PI + Math.PI / 10);
			var distanceExpected:Number = new Angle(Math.PI / 5).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}
		
		public function test006():void
		{
			var foo:Angle = new Angle(Math.PI / 10);
			var bar:Angle = new Angle(-Math.PI / 10);
			var distanceExpected:Number = new Angle(Math.PI / 5).radians;
			var distanceActual:Number = Angle.between(foo, bar).radians;
			Assert.assertEquals(distanceExpected, distanceActual);
		}	
		
	}

}