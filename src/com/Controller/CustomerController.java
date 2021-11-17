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
import org.springframework.web.bind.annotation.ResponseBody;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;
import com.Entity.OrderDetail;
import com.Entity.ShoppingCart;

import interf.Servicebd.CustomerServiceBd;

@Controller
public class CustomerController {

	String userEm;
	String userPw;
	String userNa;
	String userFn;
	String userLn;

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

	// return login page
	@RequestMapping("/")
	public String welcome() {
		return "login";
	}

	// Customer Dash LINKS

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
			System.out.println("/////////////////////////////////////" + s.getFname());
			System.out.println("/////////////////////////////////////" + s.getLname());
			System.out.println("/////////////////////////////////////" + s.getPassword());
			System.out.println("/////////////////////////////////////" + s.getEmail());
			System.out.println("/////////////////////////////////////" + s.getHouseno());
			System.out.println("/////////////////////////////////////" + s.getStreetname());
			System.out.println("/////////////////////////////////////" + s.getCityname());
			System.out.println("/////////////////////////////////////" + s.getPostal());
			System.out.println("/////////////////////////////////////" + s.getPhone());
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
		String userWrong = "";
		String loginsuc = "User Registered Successfull!";
		request.setAttribute("userWrong", userWrong);
		request.setAttribute("regSuccess", loginsuc);
		service.insert(user);
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
	@RequestMapping(value = "/loginprocess", method = RequestMethod.GET)
	public String login(@ModelAttribute("userList") AdminCustomerEntity userList, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userWrong = "Username or Password incorrect!";

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
	public String saveMessage(AdminMessageEntity mesDetails) {
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
	public String updatePersonal(AdminCustomerEntity personalList) {
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getId());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getFname());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getLname());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getUname());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getEmail());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getHouseno());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getStreetname());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getCityname());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getPassword());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getPhone());
		System.out.println("UPDATE PERSONAL CONTROLLER////////" + personalList.getPostal());

		service.updatePersonal(personalList);
		return "account";
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
		System.out.println("ERROR//////" + proDetails.getName());
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
	public String saveorder(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>) session.getAttribute("proDetails");

		for (int i = 0; i < shoppingCart.size(); i++) {

			OrderDetail orderdetail = new OrderDetail();

		}

		return "cart";
	}

}
