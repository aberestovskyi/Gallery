package com.gallery.net.services
{
	import com.gallery.events.GalleryEvent;

	import org.robotlegs.mvcs.Actor;

	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	/**
	 * @author aberestovskyi
	 */
	public class WebGalleryService extends Actor implements IGalleryImageService
	{
		public function WebGalleryService()
		{
			super();
		}
		
		public function loadImage(url:String):void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadImageComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoErrorEvent);
			loader.load(new URLRequest(url));	
		}
		
		private function onLoadImageComplete(evt:Event):void
		{
			var loaderInfo:LoaderInfo = evt.currentTarget as LoaderInfo;
			
			loaderInfo.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadImageComplete);
			loaderInfo.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIoErrorEvent);
			
			dispatch(new GalleryEvent(GalleryEvent.LOAD_IMAGE_COMPLETE, loaderInfo.loader.content));
		}
		
		private function onIoErrorEvent(evt:IOErrorEvent):void
		{
			trace(evt.text);
		}
	}
}