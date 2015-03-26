package com.gallery.view
{
	import com.greensock.easing.Ease;
	import com.greensock.easing.Quad;

	import flash.display.Sprite;


	/**
	 * @author aberestovskyi
	 */
	public class GalleryView extends Sprite
	{
		private static const PADDING:int = 5;
		private static const MOVEING_SECONDS:Number = 0.3;
		
		private var _images:Vector.<Image>;
		private var _lastRemovedImageIndex:int = -1;
		public function GalleryView()
		{
			_images = new Vector.<Image>();
		}
		
		public function addImage(image:Image):void
		{
			image.alpha = 0;
			image.isNew = true;
			if(_lastRemovedImageIndex >=0)
				_images.splice(_lastRemovedImageIndex, 0, image);
			else
				_images.push(image);
				
			addChild(image);				
		}
		
		public function removeImage(image:Image):void
		{
			var ind:int = _images.indexOf(image);
			
			if(ind >=0)
			{
				_lastRemovedImageIndex = ind;
				_images.splice(ind, 1);
				removeImage(image);		
			}		
		}
		
		public function updateLayout():void
		{
			var countImages:int = _images.length;
			
			var type:String = "";
			for(var i:int =0; i<_images.length; i++)
			{
				type+=_images[i].format;
			}
			
			if(countImages == 3)
			{
				//if all images the same by type
				if(type == "ppp" || type == "lll")
					set3aPosition(_images[0],_images[1],_images[2]);
				else
				{
					
					set3bPosition(_images[0],_images[1],_images[2]);
				}
			}
		}
		
		
		private function set3aPosition(image1:Image, image2:Image, image3:Image):void
		{
			var r1:Number = image1.ratio;
			var r2:Number = image2.ratio;
			var r3:Number = image3.ratio;

			var tw:Number = stage.stageWidth;
			var h1:int = (6 * PADDING - tw)/(-r3 -r2 -r1);
			
			image1.setHeight(h1);
			image2.setHeight(h1);
			image3.setHeight(h1);

			var image2X:Number = h1 * image1.ratio + PADDING * 3;
			var easing:Ease = Quad.easeOut;
			image1.moveTo(PADDING, PADDING, MOVEING_SECONDS, easing);
			image2.moveTo(image2X, PADDING, MOVEING_SECONDS, easing);
			image3.moveTo(image2X + h1 * image2.ratio +  PADDING * 2, PADDING, MOVEING_SECONDS, easing, showNewImage);
		}
		
		//LLP
		private function set3bPosition(image1:Image, image2:Image, image3:Image):void
		{
			var r1:Number = image1.ratio;
			var r2:Number = image2.ratio;
			var r3:Number = image3.ratio;
			
			var tw:Number = stage.stageWidth;
			var w1:int = -((2 * r3 * r1 * r2 * PADDING + 4 * r1 * r2 * PADDING - r1 * r2 * tw) / (r3 * r1 + r2 * r1 + r3 * r2));
			var w2:int = (r3 * (-4 * r1 * PADDING + 2 * r1 * r2 * PADDING - 4 * r2 * PADDING + r1 * tw + r2 * tw)) /(r3 * r1 + r2 * r1 + r3 * r2);
			
			image1.setWidth(w1);
			image2.setWidth(w1);
			image3.setWidth(w2);
	
			var easing:Ease = Quad.easeOut;
			image1.moveTo(PADDING, PADDING, MOVEING_SECONDS, easing);
			image2.moveTo(PADDING, PADDING +  w1/image1.ratio + PADDING*2, MOVEING_SECONDS, easing);
			image3.moveTo(PADDING + w1 + PADDING*2, PADDING, MOVEING_SECONDS, easing, showNewImage);
		}
		
		private function showNewImage():void
		{
			for(var i:int =0; i<_images.length; i++)
			{
				if(_images[i].isNew)
				{
					_images[i].isNew = false;
					_images[i].alphaTo(1, 0.2, Quad.easeOut);
				}
			}
			
			
		}
	}
}
