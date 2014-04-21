package helpers;


@:generic class ObjectHelper {
	
	
	public static function copyFields<T> (source:T, destination:T):T {
		
		for (field in Reflect.fields (source)) {
			
			Reflect.setField (destination, field, Reflect.field (source, field));
			
		}
		
		return destination;
		
	}
	
	
	public static function copyMissingFields<T> (source:T, destination:T):T {
		
		for (field in Reflect.fields (source)) {
			
			if (!Reflect.hasField (destination, field)) {
				
				Reflect.setField (destination, field, Reflect.field (source, field));
				
			}
			
		}
		
		return destination;
		
	}
	
	
	public static function copyUniqueFields<T> (source:T, destination:T, defaultInstance:T):T {
		
		for (field in Reflect.fields (source)) {
			
			var value = Reflect.field (source, field);
			
			if (value != Reflect.field (defaultInstance, field)) {
				
				Reflect.setField (destination, field, value);
				
			}
			
		}
		
		return destination;
		
	}
	
	
}