package com.newlecture.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class IndexController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* [방법1]
        ModelAndView mv = new ModelAndView();
        mv.addObject("data", "Hello Spring MVC~");
        mv.setViewName("/WEB-INF/view/index.jsp");
        */
		
		// [방법2]
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("data", "Hello Spring MVC~");
        
        return mv;
        
		
	}
	
}