package me.kolyunya.math.tests {
	
	import asunit.framework.TestSuite;
	import me.kolyunya.math.tests.AngleNormalizationTests;
	import me.kolyunya.math.tests.AngleDistanceTests;
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class AngleTests extends TestSuite
	{
		
		public function AngleTests() 
		{
			
			super();
			
			// Normalization
			this.addTest(new AngleNormalizationTests("test001"));
			this.addTest(new AngleNormalizationTests("test002"));
			this.addTest(new AngleNormalizationTests("test003"));
			this.addTest(new AngleNormalizationTests("test004"));
			this.addTest(new AngleNormalizationTests("test005"));
			this.addTest(new AngleNormalizationTests("test006"));
			this.addTest(new AngleNormalizationTests("test007"));
			this.addTest(new AngleNormalizationTests("test008"));
			
			// Distance
			this.addTest(new AngleDistanceTests("test001"));
			this.addTest(new AngleDistanceTests("test002"));
			this.addTest(new AngleDistanceTests("test003"));
			this.addTest(new AngleDistanceTests("test004"));
			this.addTest(new AngleDistanceTests("test005"));
			this.addTest(new AngleDistanceTests("test006"));
			
		}
		
	}
	
}