package com.gallery.core
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class GalleryAppLaunch extends Sprite
	{
		private var _context:GalleryContext;
		public function GalleryAppLaunch()
		{
			if(stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(evt:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_context = new GalleryContext(this);
		}
	}
}
