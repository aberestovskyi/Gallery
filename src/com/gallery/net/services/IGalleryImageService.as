package com.gallery.net.services {
	import org.osflash.signals.Signal;
	/**
	 * @author aberestovskyi
	 */
	public interface IGalleryImageService
	{
		function loadImage(url:String):void;
		function get onLoadImageCompleteSignal() : Signal;
	}
}
