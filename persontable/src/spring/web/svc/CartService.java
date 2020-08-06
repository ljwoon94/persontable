package spring.web.svc;

import java.util.List;

import spring.web.vo.CartListVO;
import spring.web.vo.CartVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.OrderDetailVO;
import spring.web.vo.OrderListVO;
import spring.web.vo.OrderVO;

public interface CartService {
	//카트담기
	public void addCart(CartListVO cartVO);
	//장바구니 목록
	public List<CartListVO> cartList(String userId);
	//장바구니 삭제
	public void deleteCart(CartVO cartVO);
	//주문 정보
	public void orderInfo(OrderVO orderVO) throws Exception;
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception;
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception;
	//주문 목록
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception;
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO orderVO) throws Exception;
	//관리자 주문 목록
	public List<OrderVO> adminOrderList() throws Exception;
	//관리자 특정 주문 목록
	public List<OrderListVO> adminOrderView(OrderVO orderVO) throws Exception;
	//배송 상태
	public void delivery(OrderVO orderVO) throws Exception; 
	//상품 수량 조절
	public void changeStock(IngredientVO ingredientVO) throws Exception;
}