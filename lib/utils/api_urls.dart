class Url {
  static const baseUrl = 'http://10.0.2.2:8000/api/v1';

  static const login = '$baseUrl/user/auth/';  // POST, {phone, [code]}
  static const account = '$baseUrl/user/account/';  // GET/PUT
  static const contact = '$baseUrl/contact/';  // GET/POST/PUT {[id]}
  static const payment = '$baseUrl/payment/';  // GET/POST/PUT {[id]}
  static const paymentList = '$baseUrl/payment/list/contact/'; // GET {id}
}