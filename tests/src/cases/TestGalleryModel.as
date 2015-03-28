package cases
{
	import com.gallery.model.GalleryModel;

	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.system.System;
	/**
	 * @author aberestovskyi
	 */
	public class TestGalleryModel
	{
		private var _model:GalleryModel;
		public function TestGalleryModel() 
		{
			
		}
		
		[Before]
		public function setUp():void
		{
			_model = new GalleryModel();
		}
		
		[After]
		public function tearDown():void
		{
			_model = null;
		}
		
		[Test]
		public function testAddImage():void
		{
			var bitmap1:Bitmap = new Bitmap();
			var bitmap2:Bitmap = new Bitmap();
			_model.addImage(bitmap1);
			_model.addImage(bitmap2);
			
			assertEquals("Count Images in model is wrong: ", _model.getImages().length, 2);
		}
		
		[Test]
		public function testRemoveImage():void
		{
			var bitmap1:Bitmap = new Bitmap(new BitmapData(100, 100));
			var bitmap2:Bitmap = new Bitmap(new BitmapData(100, 100));
			_model.addImage(bitmap1);
			_model.addImage(bitmap2);
			_model.disposeImage(bitmap1);
			assertEquals("Image wasn't removed: ", _model.getImages().length, 1);
		}
		
		[Test]
		public function testImageDisposing():void
		{
			var bitmap1:Bitmap = new Bitmap(new BitmapData(1000, 1000));
			_model.addImage(bitmap1);
			var countMemory:Number = System.totalMemory; 
			_model.disposeImage(bitmap1);
	
			assertTrue("Image wasn't disposed: ", System.totalMemory < countMemory);
		}
		
	}
}
