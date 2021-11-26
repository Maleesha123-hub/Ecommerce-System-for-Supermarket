package com.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.Order;
import com.Entity.OrderDetail;

import interf.Servicebd.AdminServiceBd;

@Controller
public class AdminController {

	int adminId;
	String adminName;

	@Autowired
	private AdminServiceBd service;

	@Autowired
	private JavaMailSender mailSender;

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public AdminServiceBd getService() {
		return service;
	}

	public void setService(AdminServiceBd service) {
		this.service = service;
	}

	// AdminDashboard Links
	/**
	 * return admin-log page
	 */
	@RequestMapping("/adminlogin")
	public String adminlogin() {
		return "admin-log";
	}

	/**
	 * return admin-user-list page
	 */
	@RequestMapping("/userlist")
	public String userlist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-user-list";
	}

	/**
	 * return admin-user-add page
	 */
	@RequestMapping("/adduser")
	public String adduser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-user-add";
	}

	/**
	 * return admin-message page
	 */
	@RequestMapping("/messages")
	public String messages(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("adminName", adminName);
		return "admin-message";
	}

	/**
	 * return admin-products page
	 */
	@RequestMapping("/products")
	public String products(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-products";
	}

	/**
	 * return admin-add-product page
	 */
	@RequestMapping("/addproducts")
	public String addproducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-add-product";
	}

	/**
	 * return admin-orders page
	 */
	@RequestMapping("/orders")
	public String orders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-orders";
	}

	/**
	 * return admin-customers page
	 */
	@RequestMapping("/customers")
	public String customers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setAttribute("adminName", adminName);
		return "admin-customers";
	}

	/**
	 * return admin-log page
	 */
	@RequestMapping("/adminBacklogin")
	public String adminBacklogin() {
		return "admin-log";
	}
	// End of dashboard//

	/**
	 * return admin-save
	 */
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	@ResponseBody
	public String saveUser(@ModelAttribute("userDetails") AdminUserAddEntity userDetails) {
		System.out.println("SAVEUSER CONTROLLER////////");
		service.saveUser(userDetails);
		return "admin-user-add";
	}

	// Load User table
	@RequestMapping(value = "/getAllUser", method = RequestMethod.GET)
	public @ResponseBody List<AdminUserAddEntity> getAllUserList() {
		System.out.println("LOAD USERTABLE////////");
		List<AdminUserAddEntity> ss = service.getAllUserList();
		return ss;
	}

	// getOneUser use ID
	@GetMapping("/getOneUser/{id}")
	@ResponseBody
	public AdminUserAddEntity getAllById(@PathVariable Long id) {
		System.out.println("GET USER BY ID////////");
		return service.getAllById(id);
	}

	// Update User
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("updateUser") AdminUserAddEntity updateUser) {
		System.out.println("UPDATE USER BY ID////////");
		service.updateUser(updateUser);
		return "admin-user-add";
	}

	// Delete user
	@PostMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable int id) {
		System.out.println("DELETE USER BY ID////////");
		service.deleteUser(id);
		return "admin-user-add";
	}

	// --
	// --
	// --
	// ---------------------------------------ADD PRODUCT CONTROLLER HANDLING
	// METHODS------------------------------------//

	// Save Product table
	@PostMapping("/saveProduct")
	public String saveProduct(AdminAddProductEntity ap) {
		System.out.println("SAVE PRODUCTS////////");
		service.saveProduct(ap);
		return "admin-add-product";
	}

	// Load Product table
	@RequestMapping(value = "/getAllProduct", method = RequestMethod.GET)
	public @ResponseBody List<AdminAddProductEntity> getAllProductList() {
		System.out.println("LOAD PRODUCT TABLE////////");
		List<AdminAddProductEntity> ss = service.getAllProductList();
		return ss;
	}

	// getOneProduct use ID
	@GetMapping("/getOneProduct/{id}")
	@ResponseBody
	public AdminAddProductEntity getAllProById(@PathVariable Long id) {
		System.out.println("GET PRODUCT BY ID////////");
		return service.getAllProById(id);
	}

	// Update User
	@PostMapping("/updateProduct")
	public String updateProduct(@ModelAttribute("updateProduct") AdminAddProductEntity updateProduct) {
		System.out.println("UPDATE PRODUCT BY ID////////");
		service.updateProduct(updateProduct);
		return "admin-add-product";
	}

	// Delete Product
	@PostMapping("/deleteProduct/{id}")
	public String deleteProduct(@PathVariable int id) {
		System.out.println("DELETE PRODUCT BY ID////////");
		service.deleteProduct(id);
		return "admin-add-product";
	}

	// --
	// --
	// --
	// ---------------------------------------Admin Message CONTROLLER HANDLING
	// METHODS------------------------------------//

	// Load Massege table
	@RequestMapping(value = "/getAllMessage", method = RequestMethod.GET)
	public @ResponseBody List<AdminMessageEntity> getAllMessageList() {
		System.out.println("LOAD MEASSAGE TABLE////////");
		List<AdminMessageEntity> ms = service.getAllMessageList();
		return ms;
	}

	// getOneMessage use ID
	@GetMapping("/readMessage/{id}")
	@ResponseBody
	public AdminMessageEntity getAllMesageById(@PathVariable Long id) {
		System.out.println("GET MESSAGE BY ID////////");
		return service.getAllMesageById(id);
	}

	// Delete Message
	@PostMapping("/deleteMessage/{id}")
	public String deleteMessage(@PathVariable int id) {
		System.out.println("DELETE MESSAGE BY ID////////");
		service.deleteMessage(id);
		return "admin-message";
	}

	// --
	// --
	// --
	// ---------------------------------------CUSTOMERS CONTROLLER HANDLING
	// METHODS------------------------------------//

	// Load Customer table

	@RequestMapping(value = "/getAllCustomer", method = RequestMethod.GET)
	public @ResponseBody List<AdminCustomerEntity> getAllCustomerList() {
		System.out.println("LOAD CUSTOMER TABLE////////");
		List<AdminCustomerEntity> cus = service.getAllCustomerList();
		return cus;
	}

	////////////////////////////////// Load Report Table/////////
	///// /////////////////Load Report Table////////

	// Delete customer
	@PostMapping("/deleteCus/{id}")
	public String deleteCustomer(@PathVariable int id) {
		System.out.println("DELETE CUSTOMER BY ID////////");
		service.deleteCustomer(id);
		return "admin-customers";
	}

	// --
	// --
	// --
	// ---------------------------------------ADMIN EMAIL SENDING
	// METHODS------------------------------------//

	@RequestMapping(value = "/sendingEmail", method = RequestMethod.POST)
	@ResponseBody
	public String sendingEmail(@ModelAttribute("adminmessage") AdminMessageEntity adminmessage) {
		// print debug info
		System.out.println("SEND EMAIL BY ADMIN////////" + "Name" + adminmessage.getName());
		System.out.println("SEND EMAIL BY ADMIN////////" + "To" + adminmessage.getEmail());
		System.out.println("SEND EMAIL BY ADMIN////////" + "Subject" + adminmessage.getMessage());
		System.out.println("SEND EMAIL BY ADMIN////////" + "message" + adminmessage.getReply());

		// creates a simple email objecct
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		simpleMessage.setTo(adminmessage.getEmail());
		simpleMessage.setSubject(adminmessage.getMessage());
		simpleMessage.setText(adminmessage.getReply());

		// sends the email
		mailSender.send(simpleMessage);
		System.out.println("Email sent successfully!");
		return "admin-message";
	}

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// USER ADD Controller------------------------------------//

	@RequestMapping("/admin")
	public String admin() {
		return "admin-log";
	}

	@RequestMapping("/admindashboard")
	public String admindashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<AdminMessageEntity> mesDetails = service.getSUmmMessaDetail();
		for (AdminMessageEntity ss : mesDetails) {
			System.out.println(ss.getMessage());
			System.out.println(ss.getEmail());
		}
		List<AdminCustomerEntity> custopDetails = service.getSUmmUserDetail();
		for (AdminCustomerEntity ss : custopDetails) {
			System.out.println(ss.getFname());
			System.out.println(ss.getLname());
			System.out.println(ss.getCityname());
		}
		List<Order> ordertopDetails = service.getSUmmOrderDetail();
		for (Order ord : ordertopDetails) {
			System.out.println(ord.getName());
			System.out.println(ord.getPayment());
			System.out.println(ord.getSubtotal());
			System.out.println(ord.getDate());
		}
		Long cus = service.countCustomer();
		Long pro = service.countProduct();
		Long ord = service.countPendingOrder();
		System.out.println(cus);
		System.out.println(pro);
		System.out.println(ord);
		request.setAttribute("cus", cus);
		request.setAttribute("pro", pro);
		request.setAttribute("ord", ord);
		request.setAttribute("mesDetails", mesDetails);
		request.setAttribute("ordertopDetails", ordertopDetails);
		request.setAttribute("custopDetails", custopDetails);
		request.setAttribute("adminName", adminName);
		return "admin-index";
	}

	// Loging to admin
	// controller-------------------------------------------------------ADMIN LOGIN

	@RequestMapping("/admin-index")
	public String adindex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminMessageEntity> mesDetails = service.getSUmmMessaDetail();
		for (AdminMessageEntity ss : mesDetails) {
			System.out.println(ss.getMessage());
			System.out.println(ss.getEmail());
		}
		List<AdminCustomerEntity> custopDetails = service.getSUmmUserDetail();
		for (AdminCustomerEntity ss : custopDetails) {
			System.out.println(ss.getFname());
			System.out.println(ss.getLname());
			System.out.println(ss.getCityname());
		}
		Long cus = service.countCustomer();
		Long pro = service.countProduct();
		Long ord = service.countPendingOrder();
		System.out.println(cus);
		System.out.println(pro);
		System.out.println(ord);
		request.setAttribute("cus", cus);
		request.setAttribute("pro", pro);
		request.setAttribute("ord", ord);
		request.setAttribute("mesDetails", mesDetails);
		request.setAttribute("custopDetails", custopDetails);
		request.setAttribute("adminName", adminName);
		return "admin-index";
	}

	/**
	 * admin login validation
	 * 
	 * @param admin
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@GetMapping("/adminlogpro")
	public String Adminlogin(@ModelAttribute("adminList") AdminUserAddEntity adminList, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userWrong = "Username or Password incorrect!";

		System.out.println("////////////////" + adminList.getUname());
		System.out.println("////////////////" + adminList.getPassword());
		System.out.println("------------------------------List retriew For loop!---------------------------");

		boolean result = service.adminlog(adminList);

		if (result == true) {
			List<AdminUserAddEntity> adminDetails = service.getAllByUname(adminList.getUname());
			this.adminId = adminList.getId();
			this.adminName = adminList.getUname();
			System.out.println(adminList.getId() + " " + adminList.getUname());
			request.setAttribute("adminDetails", adminDetails);

			RequestDispatcher dis = request.getRequestDispatcher("/admin-index");
			dis.forward(request, response);

		} else {
			System.out.println("LOGIN CONTROLLER FAIL!");
			request.setAttribute("userWrong", userWrong);
		}
		return "admin-log";
	}

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// REPORT------------------------------------//

	@RequestMapping("/customer-reports")
	public String reportsCusList() {
		return "customers-reports";
	}

	@RequestMapping("/customerreport")
	public String customerreport(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminCustomerEntity> cusList = service.getAllCustomerList();
		List<AdminAddProductEntity> proList = service.getAllProductList();
		request.setAttribute("cusList", cusList);
		request.setAttribute("proList", proList);
		RequestDispatcher dis = request.getRequestDispatcher("/customer-reports");
		dis.forward(request, response);
		return "customers-reports";
	}

	/*
	 * @RequestMapping("/orders-reports") public String reportsOrdList() { return
	 * "products-reports"; }
	 */

	/*
	 * @GetMapping("/orderreport") public String orderListreport(HttpServletRequest
	 * request, HttpServletResponse response) throws ServletException, IOException {
	 * List<Order> ordList = service.getAllOrderPendingList(); for (Order ors :
	 * ordList) { System.out.println(ors); } request.setAttribute("ordList",
	 * ordList); RequestDispatcher dis =
	 * request.getRequestDispatcher("/orders-reports"); dis.forward(request,
	 * response); return "orders-reports"; }
	 */

	// Load Order report table
	@RequestMapping(value = "/orderreport", method = RequestMethod.GET)
	public String orderreport(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LOAD ORDER REPORT PENDING TABLE////////");
		List<Order> ordList = service.getAllOrderPendingList();
		for (Order ordh : ordList) {
			System.out.println(ordh.getName());
			System.out.println(ordh.getSubtotal());
		}
		request.setAttribute("ordList", ordList);
		return "orders-reports";
	}

	@RequestMapping("/products-reports")
	public String reportsProList() {
		return "products-reports";
	}

	@RequestMapping("/productreport")
	public String productreport(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<AdminAddProductEntity> proList = service.getAllProductList();
		request.setAttribute("proList", proList);
		RequestDispatcher dis = request.getRequestDispatcher("/products-reports");
		dis.forward(request, response);
		return "products-reports";
	}

	///// Load Report Table//////
	///// Load Report Table//////////////
	///// Load Report Table///////////////////////////////////////

	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public String reports(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("adminName", adminName);
		return "admin-reports";
	}

	// Load Order table
	@RequestMapping(value = "/getAllOrderPendingList", method = RequestMethod.GET)
	public @ResponseBody List<Order> getAllOrderPendingList() {
		System.out.println("LOAD ORDER PENDING TABLE////////");
		List<Order> ss = service.getAllOrderPendingList();
		return ss;
	}

	// Delivered Order
	@PostMapping("/deliveredOrder/{orderId}")
	public String deliveredOrder(@PathVariable int orderId) {
		System.out.println("DELIVERED ORDER BY ID////////");
		service.deliveredOrder(orderId);
		return "admin-orders";
	}

	// Delivered Order
	@PostMapping("/canceledOrder/{orderId}")
	public String canceledOrder(@PathVariable int orderId) {
		System.out.println("CANCELED ORDER BY ID////////");
		service.canceledOrder(orderId);
		return "admin-orders";
	}

	/*
	 * Have to make this part Have to make this part Have to make this part Have to
	 * make this part Have to make this part
	 */
	/*
	 * Have to make this part Have to make this part Have to make this part Have to
	 * make this part Have to make this part
	 */
	// getOneOrder use OrderID
	@GetMapping("/getOneOrder/{orderId}")
	@ResponseBody
	public Order getOneOrder(@PathVariable String orderId) {
		int orderid = Integer.parseInt(orderId);
		System.out.println("GET ORDER BY ORDERID////////" + orderid);
		return service.getOneOrder(orderid);
	}

	@GetMapping("/getAllOrderDetailById/{orderId}")
	@ResponseBody
	public List<OrderDetail> getAllOrderDetailById(@PathVariable String orderId) {
		System.out.println("GET ORDERDETAIL BY ORDERID////////" + orderId);
		List<OrderDetail> cus = service.getAllOrderDetailById(orderId);
		for (OrderDetail cuss : cus) {
			System.out.println(cuss.getProductname());
			System.out.println(cuss.getQuantity());
		}
		return cus;
	}

	@RequestMapping(value = "/sendingOrderEmail", method = RequestMethod.POST)
	@ResponseBody
	public String sendingOrderEmail(@ModelAttribute("sendingOrderEmail") Order orderdetails) {
		// print debug info
		System.out.println("SEND EMAIL BY ADMIN////////" + "Name" + orderdetails.getName());
		System.out.println("SEND EMAIL BY ADMIN////////" + "To" + orderdetails.getEmail());
		System.out.println("SEND EMAIL BY ADMIN////////" + "Subject" + "Parakrama Supermarket Order !");
		System.out.println("SEND EMAIL BY ADMIN////////" + "message" + orderdetails.getReply());

		// creates a simple email objecct
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		simpleMessage.setTo(orderdetails.getEmail());
		simpleMessage.setSubject("Parakrama Supermarket Order !");
		simpleMessage.setText(orderdetails.getReply());

		// sends the email
		mailSender.send(simpleMessage);
		System.out.println("Order Email sent successfully!");
		return "admin-orders";
	}
}
