package org.mccc.springboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.PageMaker;
import org.mccc.springboard.domain.ReplyVO;
import org.mccc.springboard.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReplyVO replyVO) {
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService.createReply(replyVO);
			entity = new ResponseEntity<>("writeSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{articleNo}/{pageNo}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("articleNo") Integer articleNo, @PathVariable("pageNo") Integer pageNo) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(pageNo);
			
			List<ReplyVO> replies = replyService.listReplyCriteria(articleNo, criteria);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(replyService.countReplies(articleNo));
			
			Map<String, Object> map = new HashMap<>();
			map.put("replies", replies);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@RequestBody ReplyVO replyVO) {
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService.updateReply(replyVO);
			entity = new ResponseEntity<>("modifySuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{replyNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("replyNo") Integer replyNo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			replyService.deleteReply(replyNo);
			entity = new ResponseEntity<>("removeSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
