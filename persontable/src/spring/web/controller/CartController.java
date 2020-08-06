package spring.web.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.web.svc.CartService;
import spring.web.vo.CartListVO;
import spring.web.vo.CartVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.MemberVO;
import spring.web.vo.OrderDetailVO;
import spring.web.vo.OrderListVO;
import spring.web.vo.OrderVO;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;

	// 카트담기
	@ResponseBody
	@RequestMapping("/cart/addCart")
	public int addCart(CartListVO cartVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cartVO.setUserId(member.getUserId());
			cartService.addCart(cartVO);
			result = 1;
		}

		return result;
	}

	// 카트목록
	@RequestMapping(value = "/cart/cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartListVO> cartList = cartService.cartList(userId);

		model.addAttribute("cartList", cartList);

		return "cart/cartList";
	}
	
	// 주문
	@RequestMapping(value = "/cart/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);

		cartService.orderInfo(order);

		orderDetail.setOrderId(orderId);
		cartService.orderInfo_Details(orderDetail);

		cartService.cartAllDelete(userId);

		return "redirect:/cart/orderList";
	}

	// 카트삭제
	@ResponseBody
	@RequestMapping(value = "/cart/deleteCart")
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		int result = 0;
		int cartNum = 0;

		if (member != null) {
			cart.setUserId(userId);

			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				cartService.deleteCart(cart);
			}
			result = 1;
			
		}
		return result;
	}


	// 주문 목록
	@RequestMapping(value = "/cart/orderList", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);

		List<OrderVO> orderList = cartService.orderList(order);

		model.addAttribute("orderList", orderList);

		return "cart/orderList";
	}

	// 주문 상세 목록
	@RequestMapping(value = "/cart/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {
		

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = cartService.orderView(order);

		model.addAttribute("orderView", orderView);
	}
	
	// 관리자 주문 목록
	@RequestMapping(value = "/cart/adminOrderList", method = RequestMethod.GET)
	public String getOrderList(Model model) throws Exception {
	
	   
	 List<OrderVO> orderList = cartService.adminOrderList();
	 
	 model.addAttribute("orderList", orderList);
	 return "cart/admin_order_list";
	}

	// 관리자 주문 상세 목록
	@RequestMapping(value = "/cart/adminOrderView", method = RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String orderId,
	      OrderVO orderVO, Model model) throws Exception {
	 
	 
	 orderVO.setOrderId(orderId);  
	 List<OrderListVO> orderView = cartService.adminOrderView(orderVO);
	 
	 model.addAttribute("orderView", orderView);
	 
	 return "cart/admin_order_view";
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/cart/adminOrderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
	
	   
	 cartService.delivery(order);
	 
	 List<OrderListVO> orderView = cartService.orderView(order);
	 IngredientVO ingredient = new IngredientVO();
	   
	 for(OrderListVO i : orderView) {
		 ingredient.setIngNum(i.getIngNum());
		 ingredient.setIngStock(i.getCartStock());
		 cartService.changeStock(ingredient);
	 }

	 return "redirect:adminOrderView?n=" + order.getOrderId();
	}
}
