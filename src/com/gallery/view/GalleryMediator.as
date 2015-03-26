package com.gallery.view
{
	import com.gallery.events.GalleryEvent;
	import com.gallery.model.GalleryModel;

	import org.robotlegs.mvcs.Mediator;

	import flash.display.Bitmap;

	/**
	 * @author aberestovskyi
	 */
	public class GalleryMediator extends Mediator
	{
		[Inject]
		public var view:GalleryView;
		
		[Inject]
		public var imagesModel:GalleryModel;
		
		public function GalleryMediator()
		{
			super();
		}
		
		override public function onRegister() : void
		{
			super.onRegister();
			
			eventDispatcher.addEventListener(GalleryEvent.LOADING_COMPLETE, onLoadAllImagesCompleted);
			eventDispatcher.addEventListener(GalleryEvent.REMOVE_IMAGE, onRemoveImage);
			eventDispatcher.addEventListener(GalleryEvent.LOAD_NEW_IMAGE_COMPLETE, onAddNewImage);
		}
		
		private function onRemoveImage(event : GalleryEvent) : void
		{
			var image:Image = event.data as Image;
			view.removeImage(image);
			imagesModel.disposeImage(image.bitmap);
			dispatch(new GalleryEvent(GalleryEvent.LOAD_NEW_IMAGE));
		}
		
		private function onAddNewImage(event : GalleryEvent) : void
		{
			view.addImage(new Image(imagesModel.getImage(2)));
			view.updateLayout();
		}

		private function onLoadAllImagesCompleted(event : GalleryEvent) : void
		{
			var bitmaps:Vector.<Bitmap> = imagesModel.getImages();
			for(var i:int = 0; i<3; i++)
			{
				view.addImage(new Image(bitmaps[i]));
			}
			view.updateLayout();
		}
		
		override public function onRemove() : void
		{
			super.onRemove();
			
			eventDispatcher.removeEventListener(GalleryEvent.LOAD_NEW_IMAGE_COMPLETE, onAddNewImage);
			eventDispatcher.removeEventListener(GalleryEvent.REMOVE_IMAGE, onRemoveImage);
			eventDispatcher.removeEventListener(GalleryEvent.LOADING_COMPLETE, onLoadAllImagesCompleted);
		}

	}
}
