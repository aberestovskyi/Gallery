package com.gallery.model
{
	import org.robotlegs.mvcs.Actor;

	import flash.display.Bitmap;

	/**
	 * @author aberestovskyi
	 */
	public class GalleryModel extends Actor
	{
		private var _images:Vector.<Bitmap>;
		private var _lastLoadedImageIndex:int;
		public function GalleryModel()
		{
			super();
			_images = new Vector.<Bitmap>();
		}

		public function addImage(bitmap:Bitmap):void
		{
			_lastLoadedImageIndex++;
			_images[_images.length] = bitmap;
		}
		
		public function disposeImage(bitmap:Bitmap):void
		{
			var ind:int = _images.indexOf(bitmap);
			if(ind >=0)
			{
				_images.splice(ind, 1);
				bitmap.bitmapData.dispose();
				bitmap = null;
			}
		}
		
		public function getImage(ind:int):Bitmap
		{
			if(ind < _images.length)
				return _images[ind];
			
			return null;
		}
		
		public function getImages():Vector.<Bitmap>
		{
			return _images;
		}

		public function get lastLoadedImageIndex() : int
		{
			return _lastLoadedImageIndex;
		}

		public function set lastLoadedImageIndex(value : int) : void
		{
			_lastLoadedImageIndex = value;
		}
	}
}
