package cases
{
	import flexunit.framework.Assert;

	import com.gallery.factory.ImagesFactory;
	import com.gallery.net.services.WebGalleryService;

	import org.flexunit.asserts.assertNotNull;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;
	/**
	 * @author aberestovskyi
	 */
	public class TestWebGalleryService
	{
		private var _service:WebGalleryService;
		
		public function TestWebGalleryService() 
		{
			
		}
		
	
		[Before]
		public function setUp():void
		{
			_service = new WebGalleryService();
		}
		
		[After]
		public function tearDown():void
		{
			_service = null;
		}
		
		[Test(async)]
		public function testRetreiveImages():void
		{
			handleSignal(this, _service.onLoadImageCompleteSignal, onLoadImageComplete, 8000, null, handleServiceTimeout);		  	
			_service.loadImage(ImagesFactory.getImageURL(0));
		}
		
		private function onLoadImageComplete(event:SignalAsyncEvent, data:Object):void
		{
			assertNotNull("The gallery should have some photos: ", event.args[0]);
		}
		
		private function handleServiceTimeout(data:Object ):void
		{
			Assert.fail('Pending Event Never Occurred');
		}
	}
}
