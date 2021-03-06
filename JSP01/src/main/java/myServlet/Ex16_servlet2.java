package myServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex16_servlet2
 */
// 웹주소 
@WebServlet("/ex16_servlet2")
public class Ex16_servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 한글 인코딩 
		response.setContentType("text/html; charset=UTF-8");
		// 웹브라우저에 출력하기 위해 PrinterWriter  참조 변수 생성 
		PrintWriter out = response.getWriter();
		// out.println(html태그, 변수, 계산식 등등) 사용가능 => 웹브라우저 출력 
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>서블릿으로 웹페이지 연동하기</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello world</h1>");
		out.println("</body>");
		out.println("</html>");
	}
}
