package spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.CartListVO;
import spring.web.vo.CartVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.OrderDetailVO;
import spring.web.vo.OrderListVO;
import spring.web.vo.OrderVO;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addCart(CartListVO cartVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.addCart", cartVO);
	}

	@Override
	public List<CartListVO> cartList(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.cartList", userId);
	}

	@Override
	public void deleteCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("cartMapper.deleteCart", cartVO);
	}
	@Override
	public void orderInfo(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.orderInfo", orderVO);
	}
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetailVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("cartMapper.orderInfo_Details", orderDetailVO);
	}
	
	@Override
	public void cartAllDelete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("cartMapper.cartAllDelete", userId);
	}

	@Override
	public List<OrderVO> orderList(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.orderList", orderVO);
	}
	
	@Override
	public List<OrderListVO> orderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.orderView", orderVO);
	}
	
	@Override
	public List<OrderVO> adminOrderList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.adminOrderList");
	}
	@Override
	public List<OrderListVO> adminOrderView(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cartMapper.adminOrderView", orderVO);
	}
	@Override
	public void delivery(OrderVO orderVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("cartMapper.delivery", orderVO);
	}
	@Override
	public void changeStock(IngredientVO ingredientVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("cartMapper.changeStock", ingredientVO);
	}
}
