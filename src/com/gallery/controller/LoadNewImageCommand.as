package com.gallery.controller {
	import com.gallery.events.GalleryEvent;
	import com.gallery.factory.ImagesFactory;
	import com.gallery.model.GalleryModel;
	import com.gallery.net.services.IGalleryImageService;

	import org.robotlegs.mvcs.Command;

	import flash.display.Bitmap;

	/**
	 * @author aberestovskyi
	 */
	public class LoadNewImageCommand extends Command
	{
		[Inject]
		public var imagesModel:GalleryModel;
		
		[Inject]
		public var service:IGalleryImageService;
		
		public function LoadNewImageCommand()
		{
			super();
		}

		override public function execute() : void
		{
			super.execute();
			
			var nextImage:String = ImagesFactory.getImageURL(imagesModel.lastLoadedImageIndex);
			if(!nextImage)
			{
				imagesModel.lastLoadedImageIndex = 0;
				nextImage = ImagesFactory.getImageURL(imagesModel.lastLoadedImageIndex);
			}
			
			service.onLoadImageCompleteSignal.addOnce(onLoadImageComplete);
			service.loadImage(nextImage);
		}
		
		private function onLoadImageComplete(image:Bitmap):void
		{
			imagesModel.addImage(image);
			
			eventDispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.LOAD_NEW_IMAGE_COMPLETE));
			
		}

	}
}
