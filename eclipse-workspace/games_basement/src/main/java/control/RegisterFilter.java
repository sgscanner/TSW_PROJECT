package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class RegisterFilter
 */
@WebFilter("/RegisterFilter")
public class RegisterFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public RegisterFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		if(countEmpty(request.getParameterMap())>0) {
			System.out.println("Test");
			RequestDispatcher rd=request.getRequestDispatcher("Register.jsp");
			request.setAttribute("flag","false");
			System.out.println(request.getParameter("flag"));
			rd.forward(request, response);
		}else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	private int countEmpty(Map<String, String[]> map) {
		int count=0;
		
		@SuppressWarnings("rawtypes")
		Iterator it=map.entrySet().iterator();
		
		while(it.hasNext()) {
			@SuppressWarnings("unchecked")
			Map.Entry<String, String[]> entry=(Map.Entry<String,String[]>)it.next();
			
			String key = entry.getKey();
            String[] value = entry.getValue();

            if(value.length>=1) {
            	for(int i=0;i<value.length;i++) {
            		if(value[i].isEmpty()) count++;
            	}
            }
		}
		
		return count;
	}
}
