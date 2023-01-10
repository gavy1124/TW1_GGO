package main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.ggo.board.Board_DTO;
import com.multi.ggo.board.Board_Service;

@Controller
public class IndexController {
	Board_Service service;
	@Autowired
	public IndexController(Board_Service service) {
		super();
		this.service = service;
	}


	@RequestMapping("/index.do")
	public String index(Model model) {
		List<Board_DTO> boardlist = service.findByCategory("게시판");
		model.addAttribute("boardlist",boardlist);
		//System.out.println("boardlist공유체크 : "+boardlist);
		return "index";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}


