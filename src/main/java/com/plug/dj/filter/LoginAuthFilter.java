package com.plug.dj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class LoginAuthFilter implements Filter { //만약, 로그인이 안 된 상태에서 들어간다 하면 로그인 페이지로 가도록..
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		if (request.getSession().getAttribute("auth") == null) {
			String uri = request.getRequestURI();
			System.out.println(uri); //이동하는 경로 -> myplay로 시작할 시 로그인 페이지로 이동함. 
			if (uri.startsWith("/myplay") || uri.startsWith("/booth")|| uri.startsWith("/friend")) {
				String red = request.getRequestURI();
				if (request.getQueryString() != null) {
					red = "?" + request.getQueryString();
				}
				response.sendRedirect("/login?redirect=" + red);
				return;
			}
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig arg0) throws ServletException {
	}
	public void destroy() {
	}
}
