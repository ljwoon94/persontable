package spring.web.dao;

import java.util.List;

import spring.web.vo.CartListVO;
import spring.web.vo.CartVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.OrderDetailVO;
import spring.web.vo.OrderListVO;
import spring.web.vo.OrderVO;

public interface CartDAO {
	public void addCart(CartListVO cartVO);
	
	public List<CartListVO> cartList(String userId);
	
	public void deleteCart(CartVO cartVO);

	public void orderInfo(OrderVO orderVO) throws Exception;
	
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception;

	public void cartAllDelete(String userId) throws Exception;
	
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception;

	public List<OrderListVO> orderView(OrderVO orderVO) throws Exception;

	public List<OrderVO> adminOrderList() throws Exception;

	public List<OrderListVO> adminOrderView(OrderVO orderVO) throws Exception;

	public void delivery(OrderVO orderVO) throws Exception;

	public void changeStock(IngredientVO ingredientVO) throws Exception;
} 
