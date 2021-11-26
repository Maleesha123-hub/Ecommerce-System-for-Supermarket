package com.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.Order;
import com.Entity.OrderDetail;
import com.Entity.ShoppingCart;

import interf.Servicebd.CustomerServiceBd;

@Controller
public class CustomerController {

	// Order Shipping DETAILS
	String cusid;
	// concat name
	String fullname;
	// concat address
	String address;
	// telephone
	String telephone;
	// Order DETAILS
	String proid;
	String name;
	String price;
	String qty;
	String subtotal;
	String email;
	String zip;
	String stat;
	int lastOrderId;
	String payment;

	String userEm;
	String userPw;
	String userNa;
	String userFn;
	String userLn;

	String userWrong;
	String loginsuc;
	String userExists;
	String emailExists;

	int cusId;
	String cusName;

	@Autowired
	private CustomerServiceBd service;

	public CustomerServiceBd getService() {
		return service;
	}

	public void setService(CustomerServiceBd service) {
		this.service = service;
	}

	@Autowired
	private JavaMailSender mailSender;

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	// return Login page
	@RequestMapping("/")
	public String welcome() {
		return "login";
	}

	// Customer Dash LINKs

	// return home page
	@RequestMapping("/indexCus")
	public String indexCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		return "index";
	}

	// return all-product page
	@RequestMapping("/all-product")
	public String allproduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		return "all-product";
	}

	/**
	 * return all-product page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@GetMapping("/productCus")
	public void productCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminCustomerEntity> cusDetails = service.getAllByUname(cusName);
		request.setAttribute("cusDetails", cusDetails);

		for (AdminCustomerEntity ss : cusDetails) {
			System.out.println(ss.getFname());
			System.out.println(ss.getLname());
		}

		RequestDispatcher dis = request.getRequestDispatcher("/all-product");
		dis.forward(request, response);

	}

	// return about page
	@RequestMapping("/aboutCus")
	public String aboutCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		return "about";
	}

	// CONTACT DETAILS////////////////////////////////////////////////
////////////////////////

	// return contact page
	@RequestMapping("/contact")
	public String contact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "contact";
	}

	/**
	 * return contact page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/contactCus")
	public void contactCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("cusName", cusName);
		List<AdminCustomerEntity> massDetails = service.getAllByUname(cusName);
		for (AdminCustomerEntity s : massDetails) {
			System.out.println("/////////////////////////////////////" + s.getFname());
			System.out.println("/////////////////////////////////////" + s.getLname());
			System.out.println("/////////////////////////////////////" + s.getEmail());
			request.setAttribute("massDetails", massDetails);
			RequestDispatcher dis = request.getRequestDispatcher("/contact");
			dis.forward(request, response);
		}
	}

//ACCOUNT DETAILS////////////////////////////////////////////////
////////////////////////
	/**
	 * return account page
	 */
	@RequestMapping("/account")
	public String account(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("cusName", cusName);
		return "account";
	}

	/**
	 * return account page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/accountCus")
	public void accountCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("cusName", cusName);
		List<AdminCustomerEntity> accDetails = service.getAllByUname(cusName);
		for (AdminCustomerEntity s : accDetails) {
			request.setAttribute("accDetails", accDetails);
			RequestDispatcher dis = request.getRequestDispatcher("/account");
			dis.forward(request, response);
		}
	}

	// category LINKS
	/**
	 * return fruit list to categoery-fruit page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/fruitCatCus")
	public String fruitCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllFruitProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-fruit";
		}
		return "incorrect";
	}

	/**
	 * return vagitable list to categoery-vegi page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/vegiCatCus")
	public String vegiCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllVegiProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-vegi";
		}
		return "incorrect";
	}

	/**
	 * return fish/meats list to categoery-meat page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/meatCatCus")
	public String meatCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllMeatProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-meat";
		}
		return "incorrect";
	}

	/**
	 * return fish/homewareitems list to categoery-homeware page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/homewareCatCus")
	public String homewareCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllHomeWareProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-homeware";
		}
		return "incorrect";
	}

	/**
	 * return beauty products list to categoery-beauty page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/beautyCatCus")
	public String beautyCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllBeautyProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-beauty";
		}
		return "incorrect";
	}

	/**
	 * return electronic products list to categoery-electronic page
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/electronicCatCus")
	public String electronicCatCus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminAddProductEntity> proDetails = service.getAllElectronicsProList();
		if (proDetails != null) {
			request.setAttribute("proDetails", proDetails);
			request.setAttribute("cusName", cusName);
			return "categoery-electronic";
		}
		return "incorrect";
	}

	// Customer Dash LINKS End
	/**
	 * customer registration validation
	 * 
	 * @param customer
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") AdminCustomerEntity user, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		userWrong = "";
		loginsuc = "User Registered Successfull!";
		userExists = "Username or Password is already in used!";
		emailExists = "Email address is already in used!";

		request.setAttribute("userWrong", userWrong);

		service.getAllCustomerListVerify(user.getUname(), user.getPassword());
		service.getAllCustomerListVerify(user.getEmail());
		boolean isresult = service.getAllCustomerListVerify(user.getUname(), user.getPassword());
		boolean isresult2 = service.getAllCustomerListVerify(user.getEmail());

		if (isresult == true) {
			System.out.println("UNAME OR PASSWORD EXISTS");
			request.setAttribute("userExists", userExists);
			RequestDispatcher dis = request.getRequestDispatcher("/login");
			dis.forward(request, response);

		} else if (isresult2 == true) {
			System.out.println("Email EXISTS");
			request.setAttribute("emailExists", emailExists);
			RequestDispatcher dis = request.getRequestDispatcher("/login");
			dis.forward(request, response);
		} else if (isresult == false && isresult2 == false) {
			System.out.println("REGISTER DONE!");
			service.insert(user);
			request.setAttribute("regSuccess", loginsuc);
			RequestDispatcher dis = request.getRequestDispatcher("/login");
			dis.forward(request, response);
		}
		return "login";
	}

	@RequestMapping("/login")
	public String registerVerify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("cusName", cusName);
		return "login";

	}

	// --
	// --
	// --
	// ---------------------------------------UPDATE CUSTOMER
	// -- PERSONAL DETAILS------------------------------------//

	// return index page
	@RequestMapping("/index")
	public String userDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		return "index";

	}

	/**
	 * customer login validation
	 * 
	 * @param customer
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/loginprocess", method = RequestMethod.POST)
	public String login(@ModelAttribute("userList") AdminCustomerEntity userList, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userWrong = "Username or Password incorrect!";
		System.out.println(userList.getUname());
		boolean result = service.login(userList);

		if (result == true) {
			List<AdminCustomerEntity> cusDetails = service.getAllByUname(userList.getUname());
			this.cusId = userList.getId();
			this.cusName = userList.getUname();
			request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/index");
			dis.forward(request, response);

		} else {
			System.out.println("LOGIN CONTROLLER FAIL!");
			request.setAttribute("userWrong", userWrong);
		}
		return "login";
	}

	/**
	 * Save message controller
	 * 
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/saveMessages")
	public String saveMessage(AdminMessageEntity mesDetails, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SAVE MEASSAGE CONTROLLER////////" + mesDetails.getName());
		System.out.println("SAVE MEASSAGE CONTROLLER////////" + mesDetails.getEmail());
		System.out.println("SAVE MEASSAGE CONTROLLER////////" + mesDetails.getMessage());
		service.insertMessage(mesDetails);
		return "contact";
	}

	// --
	// --
	// --
	// ---------------------------------------UPDATE CUSTOMER
	// -- PERSONAL DETAILS------------------------------------//

	/**
	 * update customer
	 * 
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/updatePersonal", method = RequestMethod.POST)
	public boolean updatePersonal(@ModelAttribute("updatePersonal") AdminCustomerEntity personalList) {

		service.getAllCustomerListVerify(personalList.getUname(), personalList.getPassword());
		service.getAllCustomerListVerify(personalList.getEmail());
		boolean isresult = service.getAllCustomerListVerify(personalList.getUname(), personalList.getPassword());
		boolean isresult2 = service.getAllCustomerListVerify(personalList.getEmail());
		boolean isResult = false;
		if (isresult == true) {
			System.out.println("UNAME OR PASSWORD EXISTS");
			isResult = true;

		} else if (isresult2 == true) {
			System.out.println("Email EXISTS");
			isResult = true;

		} else if (isresult == false && isresult2 == false) {
			System.out.println("REGISTER DONE!");
			service.updatePersonal(personalList);
		}
		return isResult;
	}

	// -- SEARCH
	// CONTROLLERS----------------------------------------------------------------------
	// -- SEARCH
	// CONTROLLERS------------------------------------------------------------------------------------//

	// -- RESET
	// PASSWORD----------------------------------------------------------------------

	// return recover password page
	@RequestMapping("/recover")
	public String recoverprocess() {
		return "recoverpw";
	}

	/**
	 * password recovery
	 * 
	 * @param customer
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "/recoverprocess", method = RequestMethod.GET)
	public String recoverprocess(@ModelAttribute("userEmail") AdminCustomerEntity userEmail, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String emailF = "Your email address Incorrect !";
		String emailS = "Recovered, Check your email !";

		boolean result = service.recover(userEmail);
		System.out.println(userEmail.getEmail());
		System.out.println(result);

		if (result == true) {
			List<AdminCustomerEntity> cusDetails = service.getAllByEmail(userEmail.getEmail());

			for (AdminCustomerEntity s : cusDetails) {
				System.out.println("/////////////////////////////////////" + s.getPassword());
				userPw = s.getPassword();
				userEm = s.getEmail();
				userNa = s.getUname();
				userFn = s.getFname();
				userLn = s.getLname();
			}
			System.out.println("/////////////////////////////////////" + userEm);
			System.out.println("/////////////////////////////////////" + userPw);
			System.out.println("/////////////////////////////////////" + userNa);
			System.out.println("/////////////////////////////////////" + userFn);
			System.out.println("/////////////////////////////////////" + userLn);
			// creates a simple email objecct

			SimpleMailMessage simpleMessage = new SimpleMailMessage();
			simpleMessage.setTo(userEm);
			simpleMessage.setSubject("Parakrama Username and Password Recovery!");
			simpleMessage.setText("Mr./Mrs. " + userFn + " " + userLn + ", Your recovered Username is *** " + userNa
					+ " ***" + "  |  Password is *** " + userPw + " ***");
			// sends the email
			mailSender.send(simpleMessage);
			System.out.println("RECOVERY Email sent successfully!");

			request.setAttribute("AlertSuccess", emailS);

		} else {
			System.out.println("LOGIN CONTROLLER FAIL!");
			request.setAttribute("AlertFail", emailF);
		}
		return "recoverpw";
	}

	// CART DETAILS////////////////////////////////////////////////
////////////////////////
	// CART DETAILS////////////////////////////////////////////////
////////////////////////
	// CART DETAILS////////////////////////////////////////////////
////////////////////////
	// CART DETAILS////////////////////////////////////////////////
////////////////////////

	@RequestMapping("/cart")
	public String cart_info(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		return "cart";
	}

	/**
	 * add products for shopping cart page
	 * 
	 * @param id
	 * @param session
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @return
	 */
	@GetMapping("/ordernow/{id}")
	@ResponseBody
	public String ordernow(@PathVariable int id, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CONTROLLER PASSING///////////////////////////" + id);
		AdminAddProductEntity proDetails = service.getProDetailsById(id);

		request.setAttribute("cusName", cusName);
		System.out.println("ADD TO CART//////" + proDetails.getName());
		System.out.println(proDetails.getPrice());

		if (session.getAttribute("proDetails") == null) {
			List<ShoppingCart> shoppingCart = new ArrayList<ShoppingCart>();
			shoppingCart.add(new ShoppingCart(proDetails, 1, proDetails.getPrice()));
			session.setAttribute("proDetails", shoppingCart);
		} else {
			List<ShoppingCart> shoppingCart = (List<ShoppingCart>) session.getAttribute("proDetails");
			int index = productIsExisting(id, session);
			if (index == -1) {
				shoppingCart.add(new ShoppingCart(proDetails, 1, proDetails.getPrice()));
			} else {
				int quantity = shoppingCart.get(index).getQuantity() + 1;
				shoppingCart.get(index).setQuantity(quantity);
				float subTotal = quantity * shoppingCart.get(index).getProduct().getPrice();
				shoppingCart.get(index).setSubTotal(subTotal);
			}
			session.setAttribute("proDetails", shoppingCart);

		}

		return "cart";
	}

	/**
	 * check existing products
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	private int productIsExisting(int id, HttpSession session) {
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>) session.getAttribute("proDetails");
		for (int i = 0; i < shoppingCart.size(); i++) {
			if (shoppingCart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * delete product for shopping cart page
	 * 
	 * @param id
	 * @param session
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 * @return
	 */
	@GetMapping("/proorderdelet/{id}")
	@ResponseBody
	public String proDeleteCart(@PathVariable int id, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("cusName", cusName);
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>) session.getAttribute("proDetails");
		int index = productIsExisting(id, session);
		shoppingCart.remove(index);
		session.setAttribute("proDetails", shoppingCart);
		return "cart";
	}

//CART DETAILS////////////////////////////////////////////////
////////////////////////
//CART DETAILS////////////////////////////////////////////////
////////////////////////

	/**
	 * @return customer details to checkout page
	 * 
	 * @param session
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkout")
	public String checkouts(AdminCustomerEntity userDetails, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<AdminCustomerEntity> userDetail = service.getAllByUname(cusName);
		request.setAttribute("userDetail", userDetail);
		return "checkout";
	}

	/**
	 * @return add product to cart
	 * 
	 * @param session
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@PostMapping("/saveorder")
	@ResponseBody
	public String saveorder(@RequestParam("paymentmethod") String paymentmethod, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// save to order variables // request.setAttribute("cusName", cusName);
		List<AdminCustomerEntity> accDetails = service.getAllByUname(cusName);
		for (AdminCustomerEntity cus : accDetails) {
			cusid = String.valueOf(cus.getId()); // concat name
			String cusfname = cus.getFname();
			String cuslname = cus.getLname();
			fullname = cusfname + " " + cuslname; // concat address
			String houseno = cus.getHouseno();
			String street = cus.getStreetname();
			String city = cus.getCityname();
			address = houseno + ", " + street + ", " + city;
			telephone = cus.getPhone();
			email = cus.getEmail();
			zip = cus.getPostal();
			stat = "Pending";
			payment = paymentmethod;
		}
		System.out.println("/ORDERS Table/");
		System.out.println("Customer ID: " + cusid);
		System.out.println("Full Name: " + fullname);
		System.out.println("Address: " + address);
		System.out.println("Telephone: " + telephone);
		System.out.println("Email: " + email);
		System.out.println("Postal: " + zip);
		System.out.println("Status: " + stat);
		System.out.println("paymentmethod: " + payment);

		float proItemSubTotal = 0;
		int proItemCount = 0;
		if (session.getAttribute("proDetails") == null) {

		} else {
			List<ShoppingCart> proItemCartList = (List<ShoppingCart>) session.getAttribute("proDetails");

			for (int a = 0; a < proItemCartList.size(); a++) {
				proItemSubTotal = proItemSubTotal + proItemCartList.get(a).getSubTotal();
				proItemCount = proItemCount + 1;
			}
		}
		System.out.println("Subtotal: " + proItemSubTotal);
		subtotal = String.valueOf(proItemSubTotal);

		System.out.println("IS EVERYTHING ALRIGHT !");
		service.saveOrder(address, cusid, fullname, subtotal, telephone, email, zip, stat, payment);

		// Order details table
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>) session.getAttribute("proDetails"); // Add new order
		for (ShoppingCart s : shoppingCart) {
			// save to order details variables proid =
			String.valueOf(s.getProduct().getId());
			name = String.valueOf(s.getProduct().getName());
			price = String.valueOf(s.getProduct().getPrice());
			proid = String.valueOf(s.getProduct().getId());
			qty = String.valueOf(s.getQuantity());
			Order proDetails = service.getOrderIdFromLastRow();
			lastOrderId = proDetails.getOrderId();

			System.out.println("/////RELEVANT ORDERS DETAILS//////");
			System.out.println("/ORDERS DETAILS Table/");
			System.out.println("Product ID: " + proid);
			System.out.println("Name: " + name);
			System.out.println("Price: " + price);
			System.out.println("Qty: " + qty);
			System.out.println("LastOrderId: " + proDetails.getOrderId());
			System.out.println("Order Details saved Done!");
			service.saveOrderDetails(lastOrderId, price, proid, name, qty);
		}
		return "cart";
	}

	@PostMapping("/cancelorderCashOnDelivery")
	@ResponseBody
	public String cancelorderCashOnDelivery(@RequestParam("id") String id, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Order proDetails = service.getOrderIdFromLastRow();
		lastOrderId = proDetails.getOrderId();
		System.out.println("Customer id : " + lastOrderId);
		service.cancelorderCashOnDelivery(lastOrderId);
		return "cart";
	}

}
