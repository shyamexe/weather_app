// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'as pm;

class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData locationData;
  const LocationLoaded({
    required this.locationData,
  });

  @override
  List<Object> get props => [locationData];
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial()) {
    initLoc();
  }

  initLoc() async {
    // emit(LocationLoading());
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    print(permissionGranted);
    if (permissionGranted == PermissionStatus.granted ||
        permissionGranted == PermissionStatus.grantedLimited) {
      emit(LocationLoaded(locationData: await location.getLocation()));
    } else {
      //  await pm.Permission.location.request().isPermanentlyDenied;
      permissionGranted = await location.requestPermission();
      print(permissionGranted);
      if (permissionGranted == PermissionStatus.granted) {
        emit(LocationLoaded(locationData: await location.getLocation()));
      } else {
        emit(LocationInitial());
      }
    }
  }
}
