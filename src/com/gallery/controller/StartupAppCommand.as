package com.gallery.controller
{
	import com.gallery.events.GalleryEvent;
	import com.gallery.factory.ImagesFactory;
	import com.gallery.model.GalleryModel;
	import com.gallery.net.services.IGalleryImageService;

	import org.robotlegs.mvcs.Command;

	import flash.display.Bitmap;



	/**
	 * @author aberestovskyi
	 */
	public class StartupAppCommand extends Command
	{
		[Inject]
		public var imagesModel:GalleryModel;
		
		[Inject]
		public var service:IGalleryImageService;
		
		private var _totalImages:int;
		private var _countLoadedImages:int;
		public function StartupAppCommand()
		{
			super();
		}

		override public function execute() : void
		{
			super.execute();
			

			_totalImages = 3;
			service.onLoadImageCompleteSignal.add(onLoadImageComplete);
			service.loadImage(ImagesFactory.getImageURL(0));
			service.loadImage(ImagesFactory.getImageURL(1));
			service.loadImage(ImagesFactory.getImageURL(2));
		}
		
		private function onLoadImageComplete(image:Bitmap):void
		{
			imagesModel.addImage(image);
			
			
			_countLoadedImages++;
			if (_countLoadedImages >= _totalImages)
			{
				service.onLoadImageCompleteSignal.remove(onLoadImageComplete);
				
				eventDispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.LOADING_COMPLETE));
			}
		}
		
	}
}
