package com.mycrud.mycrud;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.sample.dao.crudDAO;
import com.sample.dto.Criteria;
import com.sample.dto.PageMaker;
import com.sample.dto.crudVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
	@Inject
    private crudDAO dao;
	private static int wherepage =1;//너의 페이지
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	    List<crudVO> crudList = dao.select();               
	    model.addAttribute("list", crudList); 
		
		return "redirect:/list?page="+wherepage;
	}

	@RequestMapping("insert")//이경로를 치면
	public String insert() {
		return "join";//join 으로 들어갑니다.		
	}
    @RequestMapping(method=RequestMethod.POST, value="/student")
    public String go(HttpServletRequest httpServletRequest, Model model) throws Exception {
		
    	String title=httpServletRequest.getParameter("title");
    	String content=httpServletRequest.getParameter("content");
    	String name=httpServletRequest.getParameter("name");    	
    	crudVO vo = new crudVO();
    	    	
    	vo.setTitle(chWord(title));//파라미터 값을 받아 입력합니다.
        vo.setContent(chWord(content));
        vo.setName(chWord(name));
        dao.insert(vo);  //DB에 삽입    	

    	return "redirect:/";//Home으로 리다이렉트 반환
    }	
    
	@RequestMapping("view/{no}")//이경로를 치면
	public String view(@ModelAttribute("cri") Criteria cri,@PathVariable int no, Model model) throws Exception {
		//int no= Integer.parseInt(no);
		dao.visit(no);
		//LIST로 구현할시
		//List<crudVO> list = dao.view(no);
		//model.addAttribute("list", list);
		crudVO list = dao.view(no);
		model.addAttribute("list", list);
		logger.info("페이지넘버 "+ wherepage);
		return "view";//view로 들어갑니다.		
	}

	@RequestMapping("remove/{no}")//이경로를 치면 삭제
	public String delete(@PathVariable int no, Model model) throws Exception {
		dao.delete(no);
		
		return "redirect:/list?page="+wherepage;		
	}
	@RequestMapping(value="updateCon/{no}")
	public String updateCon(@PathVariable int no, Model model) throws Exception{
		crudVO list = dao.view(no);
		//model.addAttribute("list", list);	
		model.addAttribute("no", list.getNo());
		model.addAttribute("name", list.getName());
		model.addAttribute("title", modWord(list.getTitle()));
		model.addAttribute("content", modWord(list.getContent()));
		model.addAttribute("date", list.getDate());
		model.addAttribute("visit", list.getVisit());
		return "updateCon";		
	}
	@RequestMapping(value="updateCon/update", method=RequestMethod.POST)
	public String updateGo(crudVO vo, Model model) throws Exception {
		crudVO input = new crudVO();
		input.setNo(vo.getNo());
		input.setTitle(chWord(vo.getTitle()));
		input.setContent(chWord(vo.getContent()));
		
		dao.updateCon(input);
		crudVO list = dao.view(vo.getNo());
		model.addAttribute("list", list);
		return "view";	
	}

	  @RequestMapping(value = "/list", method = RequestMethod.GET)
	  public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

	    logger.info(cri.toString());
	    wherepage=cri.getPage();//현재페이지 위치
	    model.addAttribute("list", dao.listCriteria(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(dao.countPaging(cri));
	    if(cri.getPage() > pageMaker.getEndPage()) {
	    	return "redirect:list?page="+Integer.toString(pageMaker.getEndPage());
	    }
	    	
	    model.addAttribute("pageMaker", pageMaker);
		return "list";
	  }
	
	
	  
	  
	  
	  
	//문자열 <> 치환 함수
	public String chWord(String word) {
		String title="";
		//title = word.replaceAll("&","&amp").replaceAll("\"","&quot").replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>");
		title = word.replaceAll("&","&amp");
		title = word.replaceAll("\"","&quot");
		title = word.replaceAll(" ","&nbsp");
		title = word.replaceAll("<","&lt");
		title = word.replaceAll(">","&gt");
		title = word.replaceAll("\n","<br>");
		return title;
	}
	
	public String modWord(String word) {
		String title="";
		//title = word.replaceAll("&","&amp").replaceAll("\"","&quot").replaceAll(" ","&nbsp").replaceAll("<","&lt").replaceAll(">","&gt").replaceAll("\n","<br>");
		title = word.replaceAll("&amp","&");
		title = word.replaceAll("&quot","\\\"");
		title = word.replaceAll("&nbsp"," ");
		title = word.replaceAll("&lt","<");
		title = word.replaceAll("&gt",">");
		title = word.replaceAll("<br>","\n");
		return title;
	}
	
}



