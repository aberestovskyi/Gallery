package com.gallery.view
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Ease;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * @author aberestovskyi
	 */
	public class Image extends Sprite
	{
		private var _ratio:Number;
		private var _format:String;
		private var _bitmap:Bitmap;
		private var _isNew:Boolean;
		public function Image(bitmap:Bitmap) 
		{
			_bitmap = bitmap;
			_ratio = bitmap.width/bitmap.height;
			_format = (bitmap.width > bitmap.height) ? "l" : "p";
			
			addChild(bitmap);
			mouseChildren = false;
			buttonMode = true;	
		}
		
		public function moveTo(x:Number, y:Number, seconds:Number, ease:Ease = null, onComplete:Function = null,  onCompleteParams:Array = null):void
		{
			TweenLite.to(this, seconds, {x: x, y:y, ease:ease, onComplete: onComplete, onCompleteParams: onCompleteParams});
		}
		
		public function alphaTo(value:Number, seconds:Number, ease:Ease = null, onComplete:Function = null,  onCompleteParams:Array = null):void
		{
			TweenLite.to(this, seconds, {alpha: value, ease:ease, onComplete: onComplete, onCompleteParams: onCompleteParams});
		}
		
		public function scaleTo(value:Number, seconds:Number,  ease:Ease = null, onComplete:Function = null,  onCompleteParams:Array = null):void
		{
			TweenLite.to(this, seconds, {scaleX: value, scaleY:value, ease:ease, onComplete: onComplete, onCompleteParams: onCompleteParams});
		}
		
		public function setWidth(value:Number):void
		{
			var currentScale:Number = scaleX;
			scaleX = scaleY = 1;
			var newScale:Number = value/width;
			
			if(_isNew)
				scaleX = scaleY = newScale;
			else
			{
				scaleX = scaleY = currentScale;
				scaleTo(newScale, 0.5);
			}
			
		}
		
		public function setHeight(value:Number):void
		{
			var currentScale:Number = scaleX;
			scaleX = scaleY = 1;
			var newScale:Number = value/height;
			if(_isNew)
				scaleX = scaleY = newScale;
			else
			{
				scaleX = scaleY = currentScale;
				scaleTo(newScale, 0.5);
			}
		}
		
		public function get format() : String
		{
			return _format;
		}

		public function get ratio() : Number
		{
			return _ratio;
		}

		public function get bitmap() : Bitmap
		{
			return _bitmap;
		}

		public function get isNew() : Boolean
		{
			return _isNew;
		}

		public function set isNew(value : Boolean) : void
		{
			_isNew = value;
		}
		
	}
}
