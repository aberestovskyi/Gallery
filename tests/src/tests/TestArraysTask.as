package tests
{
	import org.flexunit.asserts.assertEquals;
	/**
	 * @author aberestovskyi
	 */
	public class TestArraysTask 
	{
		
		public function TestArraysTask() 
		{
		}
		
		[Test]
		public function testSorting1():void
		{
			var a1:Array = [1,2,3,4,5];
			var a2:Array = [5,6,7];
			
			assertEquals("1,2,3,4,5,5,6,7", sortArrays(a1,a2).join(","));
		}
		
		[Test]
		public function testSorting2():void
		{
			var a1:Array = [5,6,7];
			var a2:Array = [1,2,3,4,5,6];
			
			assertEquals("1,2,3,4,5,5,6,6,7", sortArrays(a1,a2).join(","));
		}
		
		[Test]
		public function testSorting3():void
		{
			var a1:Array = [1];
			var a2:Array = [1,2,3,4,5,6,7];
			
			assertEquals("1,1,2,3,4,5,6,7", sortArrays(a1,a2).join(","));
		}
		
		[Test]
		public function testSortingDescending():void
		{
			var a1:Array = [7,6,5,4];
			var a2:Array = [3,2,1];
			
			assertEquals("7,6,5,4,3,2,1", sortArrays(a1,a2).join(","));
		}
		
		
		private function sortArrays(array1:Array, array2:Array):Array
		{
			var resultArray:Array = [];
			var ind1:int = 0;
			var ind2:int = 0;
			var leng1:int = array1.length;
			var leng2:int = array2.length;
			var totalLeng:int = leng1+leng2;
			var nextValue:int;
			
			var dir:int = (array1[0] < array2[leng2-1]) ? 1 : -1;
			
			while(ind1+ind2 < totalLeng)
			{
				if(ind2 < leng2)
				{
					if(ind1 < leng1 && ( (dir==1 && array1[ind1] <=array2[ind2]) || (dir==-1 && array1[ind1] >=array2[ind2]) ))
						nextValue = array1[ind1++];
					else
						nextValue = array2[ind2++];
				}
				else
				{
					nextValue = array1[ind1++];
				}	
				
				resultArray[resultArray.length] = nextValue;
			}
			
			return resultArray;
		}
		
	}
}
