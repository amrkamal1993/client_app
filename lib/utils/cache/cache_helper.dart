import 'package:injectable/injectable.dart';

// CacheHelper is used to efficiently store and manage data in memory.
// This helps reduce redundant data retrieval operations and improves
// application performance by allowing quick access to frequently used data.
// It's especially useful when you want to store and reuse data that doesn't
// change frequently, such as configuration settings or user-specific data.



// Define the CacheHelper class as a singleton, meaning there will be only one instance.
@singleton
class CacheHelper {
  // Private property to store key-value pairs in the cache.
  final Map<String, dynamic> _cacheMap = {};

  // Method to cache an object with a specified key.
  void cacheObject(String key, dynamic object) {
    // Store the object in the cache map using the provided key.
    _cacheMap[key] = object;
  }

  // Method to retrieve a cached object based on the provided key.
  dynamic getCachedObject(String key) {
    // Return the object associated with the provided key, or null if not found.
    return _cacheMap[key];
  }

  // Method to remove an object from the cache based on the provided key.
  void removeObject(String key) {
    // Remove the key-value pair associated with the provided key.
    _cacheMap.remove(key);
  }

  // Method to clear the entire cache, removing all key-value pairs.
  void clearCache() {
    // Clear the cache map, effectively resetting the cache.
    _cacheMap.clear();
  }
}
