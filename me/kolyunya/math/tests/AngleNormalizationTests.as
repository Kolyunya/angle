package me.kolyunya.math.tests {
	
	import asunit.framework.TestCase;
	import asunit.framework.Assert;
	import me.kolyunya.math.Angle;
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class AngleNormalizationTests extends TestCase
	{
		
		public function AngleNormalizationTests(test:String)
		{
			super(test);
		}
		
		public function test001():void
		{
			var angle:Angle = new Angle();
			angle.degrees = 270;
			var degrees:Number = angle.degrees;
			Assert.assertEquals(-90, degrees);
		}
		
		public function test002():void
		{
			var angle:Angle = new Angle();
			angle.degrees = 181;
			var degrees:Number = angle.degrees;
			Assert.assertEquals(-179, degrees);
		}
		
		public function test003():void
		{
			var angle:Angle = new Angle();
			angle.degrees = -181;
			var degrees:Number = angle.degrees;
			Assert.assertEquals(179, degrees);
		}
			
		public function test004():void
		{
			var angle:Angle = new Angle();
			angle.degrees = 361;
			var degrees:Number = angle.degrees;
			Assert.assertEquals(1, degrees);
		}		
		
		public function test005():void
		{
			var angle:Angle = new Angle();
			angle.degrees = -361;
			var degrees:Number = angle.degrees;
			Assert.assertEquals(-1, degrees);
		}
		
		public function test006():void
		{
			var angle:Angle = new Angle(Math.PI * 1.5);
			var degrees:Number = angle.degrees;
			Assert.assertEquals(-90, degrees);
		}	
		
		public function test007():void
		{
			var angle:Angle = new Angle(Math.PI * 2);
			var degrees:Number = angle.degrees;
			Assert.assertEquals(0, degrees);
		}		
		
		public function test008():void
		{
			var angle:Angle = new Angle(Math.PI * 2.5);
			var radians:Number = angle.radians;
			Assert.assertEquals(Math.PI / 2, radians);
		}
		
	}

}