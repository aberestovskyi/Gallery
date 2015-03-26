package com.gallery.core
{
	import com.gallery.controller.LoadNewImageCommand;
	import com.gallery.controller.SelectImageCommand;
	import com.gallery.controller.StartupAppCommand;
	import com.gallery.events.GalleryEvent;
	import com.gallery.model.GalleryModel;
	import com.gallery.net.services.IGalleryImageService;
	import com.gallery.net.services.WebGalleryService;
	import com.gallery.view.GalleryMediator;
	import com.gallery.view.GalleryView;
	import com.gallery.view.Image;
	import com.gallery.view.ImageMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;






	/**
	 * @author aberestovskyi
	 */
	public class GalleryContext extends Context
	{
		public function GalleryContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}

		override public function startup() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupAppCommand, ContextEvent, true);
			commandMap.mapEvent(GalleryEvent.IMAGE_CLICK, SelectImageCommand, GalleryEvent);
			commandMap.mapEvent(GalleryEvent.LOAD_NEW_IMAGE, LoadNewImageCommand, GalleryEvent);
			
			injector.mapSingletonOf(IGalleryImageService, WebGalleryService);
			
			injector.mapSingleton(GalleryModel);
			
			mediatorMap.mapView(GalleryView, GalleryMediator);
			mediatorMap.mapView(Image, ImageMediator);
			
			contextView.addChild(new GalleryView());
			
			super.startup();
		}

	}
}
