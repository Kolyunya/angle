package kolyunya.geometry 
{
	
	/**
	 * ...
	 * @author Kolyunya
	 */
	public class Angle 
	{
		
		private var _degrees:Number;
		
		private var _radians:Number;
		
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
		
		public function distanceTo(angle:Angle):Angle
		{
			
			var distanceValue:Number;
			
			var delta:Number = this.radians - angle.radians;
			
			// Check if angles have same sign
			if ( this.radians * angle.radians >= 0 )
			{
				distanceValue = Math.abs(delta);
			}
			
			else if 
			(
				( Math.PI > delta && delta > 0 )
					||
				( 0 > delta && delta > -Math.PI )
			)
			{
				distanceValue = Math.abs(this.radians) + Math.abs(angle.radians);
			}
			
			else if ( this.radians > 0 )
			{
				distanceValue = ( Math.PI - this.radians ) + ( Math.PI + angle.radians );
			}
			
			else
			{
				distanceValue = ( Math.PI - angle.radians ) + ( Math.PI + this.radians );
			}
			
			var distance:Angle = new Angle(distanceValue);
			return distance;
			
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
		
		private function normalizeDegrees():void
		{
			
			// Shrink the angle value
			this._degrees = this._degrees % 360;
			
			// ActionScript works with angles from -180 to 180
			if (Math.abs(this._degrees) < 180)
			{
				// Angle is in normal form
				return;
			}
			
			// Angle needs normalization
			var delta:Number = Math.abs(this._degrees) - 180;
			if (this._degrees > 0)
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