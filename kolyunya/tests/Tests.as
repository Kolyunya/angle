package kolyunya.tests 
{
	
	import flash.display.Sprite;
	import asunit.textui.TestRunner;
	import kolyunya.tests.geometry.angle.AngleTests;
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class Tests extends Sprite
	{
		
		public function Tests() 
		{
			var testRunner:TestRunner = new TestRunner();
			this.stage.addChild(testRunner);
			testRunner.start(AngleTests , null, TestRunner.SHOW_TRACE);
		}
		
	}

}