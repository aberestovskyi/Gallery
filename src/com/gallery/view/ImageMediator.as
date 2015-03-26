package com.gallery.view
{
	import com.gallery.events.GalleryEvent;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author aberestovskyi
	 */
	public class ImageMediator extends Mediator
	{
		[Inject]
		public var view:Image;
		
		public function ImageMediator()
		{
			super();
		}

		override public function onRegister() : void
		{
			super.onRegister();
			
			addViewListener(MouseEvent.CLICK, onMouseClick);
		}

		private function onMouseClick(evt:MouseEvent) : void
		{
			dispatch(new GalleryEvent(GalleryEvent.IMAGE_CLICK, view));
		}
		
		
		override public function onRemove() : void
		{
			super.onRemove();
			
			removeViewListener(MouseEvent.CLICK, onMouseClick);
		}

	}
}
