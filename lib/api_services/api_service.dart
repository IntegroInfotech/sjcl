import 'package:http/http.dart' as http;
import 'package:sjcl/model/director_message.dart';
import 'package:sjcl/model/events.dart';
import 'package:sjcl/model/facilities.dart';
import 'package:sjcl/model/facility_details.dart';
import 'package:sjcl/model/gallery.dart';
import 'package:sjcl/model/management_folders.dart';
import 'package:sjcl/model/menagement.dart';
import 'package:sjcl/model/news.dart';
import 'package:sjcl/model/news_images.dart';
import 'package:sjcl/model/notifications.dart';
import 'package:sjcl/model/testimonials.dart';

class ApiServices {
  static const String baseUrl = 'https://www.sjcl.edu.in/sjcl_app';

  final String newsApi = '$baseUrl/sjcl_news.php';
  final String newsImagesApi = '$baseUrl/sjcl_newsimage.php';
  final String directorMessageApi = '$baseUrl/sjcl_directormsg.php';
  final String notificationsApi = '$baseUrl/sjcl_notification.php';
  final String eventsApi = '$baseUrl/sjcl_events.php';
  final String photosApi = '$baseUrl/sjcl_photos.php';
  final String managementFolderApi = '$baseUrl/sjcl_management.php';
  final String managementListApi = '$baseUrl/sjcl_management1.php';
  final String testimonialsApi = '$baseUrl/sjcl_testimonials.php';
  final String facilitiesApi = '$baseUrl/sjcl_facilities.php';
  final String facilityDetailsApi = '$baseUrl/sjcl_facility1.php';


  Future<List<SjclNew>> fetchNews() async {
    try {
      http.Response response = await http.get(Uri.parse(newsApi));
      if (response.statusCode == 200) {
        var json = response.body;
        var jsonData = News.fromJson(json).sjclNews;
        return jsonData;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SjclNotification>> fetchNotifications() async {
    try {
      http.Response response = await http.get(Uri.parse(notificationsApi));
      if (response.statusCode == 200) {
        var jsonData = Notifications.fromJson(response.body).sjclNotification;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }

  Future<List<SjclDirectorMessage>> fetchDirectorMessage() async {
    try {
      http.Response response = await http.get(Uri.parse(directorMessageApi));
      if (response.statusCode == 200) {
        var jsonData =
            DirectorMessage.fromJson(response.body).sjclDirectorMessage;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }

  Future<List<SjclPhoto>> fetchPhotos() async {
    try {
      http.Response response = await http.post(
        Uri.parse(photosApi),
      );
      var jsonData = Gallery.fromJson(response.body).sjclPhotos;
      print('jsondata is$jsonData');
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SjclManagementFolder>> fetchManagementFolder() async {
    try {
      http.Response response = await http.post(
        Uri.parse(managementFolderApi),
      );
      var jsonData = ManagementFolders.fromJson(response.body).sjclManagement;
      print('jsondata is$jsonData');
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SjclManagement>> fetchSjclManagementList(String mid) async {
    try {
      http.Response response = await http.post(
        Uri.parse(managementListApi),
        body: {'mid': mid},
      );
      var jsonData = Management.fromJson(response.body).management;
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SjclNewsImage>> fetchSjclNewsImage(String news_id) async {
    try {
      http.Response response = await http.post(
        Uri.parse(newsImagesApi),
        body: {'news_id': news_id},
      );
      var jsonData = NewsImages.fromJson(response.body).newsImages;
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<SjclEvent>> fetchEvents() async {
    try {
      http.Response response = await http.get(Uri.parse(eventsApi));
      if (response.statusCode == 200) {
        var jsonData = Events.fromJson(response.body).sjclEvents;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }

  Future<List<SjclTestimonial>> fetchSjclTestimonial() async {
    try {
      http.Response response = await http.get(Uri.parse(testimonialsApi));
      if (response.statusCode == 200) {
        var jsonData = Testimonials.fromJson(response.body).sjclTestimonials;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }


  Future<List<SjclFacility>> fetchSjclSjclFacility() async {
    try {
      http.Response response = await http.get(Uri.parse(facilitiesApi));
      if (response.statusCode == 200) {
        var jsonData = Facilities.fromJson(response.body).sjclFacility;
        return jsonData;
      } else {
        return [];
      }
    } catch (exceptions) {
      print(exceptions);
    }
    return [];
  }

  Future<List<SjclFacilityDetails>> fetchFacilitiesDetails(String fid) async {
    try {
      http.Response response = await http.post(
        Uri.parse(facilityDetailsApi),
        body: {'fid': fid},
      );
      var jsonData = FacilitiesDetails.fromJson(response.body).facility;
      return jsonData;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
