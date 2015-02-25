package kolyunya.geometry 
{

	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class Angle 
	{
		
		private var _degrees:Number;
		
		private var _radians:Number;
		
		/**
		 * Constructs an angle from radians value.
		 * @param	degrees	An angle value in radians.
		 * @return	An angle.
		 */
		public static function fromRadians(radians:Number):Angle
		{
			var angle:Angle = new Angle();
			angle.radians = radians;
			return angle;
		}
		
		/**
		 * Constructs an angle from degrees value.
		 * @param	degrees	An angle value in degrees.
		 * @return	An angle.
		 */
		public static function fromDegrees(degrees:Number):Angle
		{
			var angle:Angle = new Angle();
			angle.degrees = degrees;
			return angle;
		}
		
		/**
		 * Calculates an angle between the positive direction of the x-axis 
		 * 	and the line, defined by two points.
		 * @param	first	The first point.
		 * @param	second	The secont point.
		 * @return	An angle.
		 */
		public static function fromZero(first:Point, second:Point):Angle
		{
			var distanceX:Number = second.x - first.x;
			var distanceY:Number = second.y - first.y;
			var angleValue:Number = Math.atan2(distanceY, distanceX);
			var angle:Angle = Angle.fromRadians(angleValue);
			return angle;
		}

		/**
		 * Calculates the shortest angle between two angles.
		 * @param	first	The first angle.
		 * @param	second	The second angle.
		 * @return 	An angle.
		 */
		public static function between(first:Angle, second:Angle):Angle
		{
			
			var distance:Number;
			
			var delta:Number = first.radians - second.radians;
			
			// Check if angles have same sign
			if ( first.radians * second.radians >= 0 )
			{
				distance = Math.abs(delta);
			}
			
			else if 
			(
				Math.PI > delta && delta > 0
					||
				0 > delta && delta > -Math.PI
			)
			{
				distance = Math.abs(first.radians) + Math.abs(second.radians);
			}
			
			else if ( first.radians > 0 )
			{
				distance = ( Math.PI - first.radians ) + ( Math.PI + second.radians );
			}
			
			else
			{
				distance = ( Math.PI - second.radians ) + ( Math.PI + first.radians );
			}
			
			var angle:Angle = Angle.fromRadians(distance);
			return angle;
			
		}
		
		/**
		 * Constructs an angle from radians value.
		 * @param	radians	An angle value in radians.
		 */
		public function Angle(radians:Number = 0)
		{
			this.radians = radians;
		}
		
		public function get radians():Number
		{
			return this._radians;
		}
		
		public function get degrees():Number
		{
			return this._degrees;
		}
		
		public function set radians(radians:Number):void
		{
			this._radians = radians;
			this.updateDegrees();
			this.normalizeDegrees();
			this.updateRadians();
		}
		
		public function set degrees(degrees:Number):void
		{
			this._degrees = degrees;
			this.normalizeDegrees();
			this.updateRadians();
		}
		
		public function isGreaterThan(angle:Angle):Boolean
		{
			
			// Calculate angles delta
			var delta:Number = this.radians - angle.radians;
			
			// Check if angles have same sign
			if ( this.radians * angle.radians >= 0 )
			{
				// Angles have the same sign. It's easy to compare them
				return this.radians > angle.radians;
			}
			
			// Angles have different signs
			if ( delta > 0 )
			{
				return delta < Math.PI;
			}
			
			else
			{
				return delta < -Math.PI;
			}
			
		}
		
		public function isLessThan(angle:Angle):Boolean
		{
			var isGreaterThan:Boolean = this.isGreaterThan(angle);
			var isLessThan:Boolean = ! isGreaterThan;
			return isLessThan;
		}
		
		public function equals(angle:Angle):Boolean
		{
			var equals:Boolean = this.radians == angle.radians;
			return equals;
		}
		
		private function normalizeDegrees():void
		{
			
			// Shrink the angle value
			this._degrees = this.degrees % 360;
			
			// ActionScript works with angles from -180 to 180
			if (Math.abs(this.degrees) < 180)
			{
				// Angle is in normal form
				return;
			}
			
			// Angle needs normalization
			var delta:Number = Math.abs(this.degrees) - 180;
			if (this.degrees > 0)
			{
				this._degrees = -180 + delta;
			}
			else
			{
				this._degrees = 180 - delta;
			}
			
		}
		
		private function updateRadians():void
		{
			this._radians = this.degrees * Math.PI / 180;
		}
		
		private function updateDegrees():void
		{
			this._degrees = this.radians / Math.PI * 180;
		}
		
	}

}