package com.gallery.controller
{
	import com.gallery.events.GalleryEvent;
	import com.gallery.view.Image;
	import com.greensock.easing.Quad;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author aberestovskyi
	 */
	public class SelectImageCommand extends Command
	{
		[Inject]
		public var event:GalleryEvent;
		
		public function SelectImageCommand()
		{
			super();
		}

		override public function execute() : void
		{
			super.execute();
			
			var image:Image = event.data as Image;
			image.mouseEnabled = false;
			image.alphaTo(0.2, 0, Quad.easeOut, onHideComplete);
		}
		
		private function onHideComplete():void
		{
			dispatch(new GalleryEvent(GalleryEvent.REMOVE_IMAGE, event.data));
		}

	}
}
