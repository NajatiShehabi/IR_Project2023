import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart' as geocode;

class LocationService {
  static LocationService? _instance;

  LocationService._();

  factory LocationService.getInstance() {
    _instance ??= LocationService._();
    return _instance!;
  }
/*

  final StreamController<Location> _riderLocationStream =
      StreamController<Location>.broadcast();

  Stream<Location> getRiderLocationStream() {
    return _riderLocationStream.stream;
  }

  Future<void> _initializeService(
      Future<void> Function(Location) onLocationChanged) async {
    // Fired whenever a location is recorded
    BackgroundGeolocation.onLocation((location) {
      onLocationChanged.call(location);
      _locationChanged(location);
    }, (error) {
      log('[error] - ${error.message}');
    });

    // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
    BackgroundGeolocation.onMotionChange((Location location) {
      log('[motionchange] - $location');
    });

    // Fired whenever the state of location-services changes.  Always fired at boot
    BackgroundGeolocation.onProviderChange((ProviderChangeEvent event) {
      log('[providerchange] - $event');
    });

    await BackgroundGeolocation.ready(
      Config(
        desiredAccuracy: Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 1.0,
        stopOnTerminate: true,
        startOnBoot: false,
        debug: false,
        logLevel: Config.LOG_LEVEL_ERROR,
      ),
    );
  }

  Future<void> startBackgroundService(
      Future<void> Function(Location) onLocationChanged) async {
    await _initializeService(onLocationChanged);
    log('done initialize');
    if ((await BackgroundGeolocation.state).enabled) {
      await BackgroundGeolocation.stop();
      log('done stopping');
    }
    await BackgroundGeolocation.start();
    await BackgroundGeolocation.changePace(true);
    log('done starting');
  }

  Future<void> stopBackgroundService() async {
    if ((await BackgroundGeolocation.state).enabled) {
      await BackgroundGeolocation.changePace(false);
      await BackgroundGeolocation.stop();
    }
  }

  Future<Location> getRiderLocation() async {
    return await BackgroundGeolocation.getCurrentPosition();
  }

  Future<void> _locationChanged(Location data) async {
    _riderLocationStream.sink.add(data);
  }
*/

  Future<List<geocode.Placemark>> getLocationByLatLon(
     double lat, double lon) async {
    final placeMarker = kDebugMode
        ? [
            geocode.Placemark(
              subLocality: 'subLocality',
              locality: 'Damascus',
              country: 'Syria',
              postalCode: "00000",
            )
          ]
        : await geocode.placemarkFromCoordinates(lat, lon,
            );
    return placeMarker;
  }
}
