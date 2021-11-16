package interf.Servicebd;

import java.sql.Blob;
import java.util.List;

import com.Entity.AdminAddProductEntity;
import com.Entity.AdminCustomerEntity;
import com.Entity.AdminMessageEntity;
import com.Entity.AdminUserAddEntity;

public interface AdminServiceBd {

	// --
	// ---------------------------------------CUSTOMER
	// SUmmery------------------------------------//
	public List<AdminCustomerEntity> getSUmmUserDetail();

	public List<AdminMessageEntity> getSUmmMessaDetail();

	public Long countCustomer();

	public Long countOrder();

	public Long countProduct();

	public Long countRevenue();

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// USER ADD------------------------------------//
	public String saveUser(AdminUserAddEntity au);

	public List<AdminUserAddEntity> getAllUserList();

	public AdminUserAddEntity getAllById(Long id);

	public void updateUser(AdminUserAddEntity user);

	public void deleteUser(int id);

	// --
	// --
	// --
	// ---------------------------------------ADMIN
	// LOGIN------------------------------------//

	public boolean adminlog(AdminUserAddEntity au);

	List<AdminUserAddEntity> getAllByUname(String uname);

	// --
	// --
	// --
	// ---------------------------------------ADD PRODUCT
	// SERVICEBd------------------------------------//

	public String saveProduct(AdminAddProductEntity ap);

	public List<AdminAddProductEntity> getAllProductList();

	public AdminAddProductEntity getAllProById(Long id);

	public void updateProduct(AdminAddProductEntity product);

	public void deleteProduct(int id);

	// --
	// --
	// --
	// ---------------------------------------Admin Message CONTROLLER HANDLING
	// METHODS------------------------------------//

	public List<AdminMessageEntity> getAllMessageList();

	public AdminMessageEntity getAllMesageById(Long id);

	public void deleteMessage(int id);

	// --
	// --
	// --
	// ---------------------------------------CUSTOMER
	// SERVICEBd------------------------------------//

	public List<AdminCustomerEntity> getAllCustomerList();

	public void deleteCustomer(int id);

}
