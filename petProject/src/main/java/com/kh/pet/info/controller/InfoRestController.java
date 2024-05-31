package com.kh.pet.info.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.common.model.vo.PageInfo;
import com.kh.pet.common.template.Pagination;
import com.kh.pet.info.model.service.InfoService;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/info")
@RequiredArgsConstructor
public class InfoRestController {

	private final InfoService infoService;
	
	@GetMapping("/{category}")
	public ModelAndView selectAll(@PathVariable("category") String category,ModelAndView mv) {
		
		switch (category) {
		case "date":
			mv.setViewName("info/dateList");
			break;
		default:
			break;
		}
		return mv;
	}
	
	@GetMapping("selectInfoList")
	public List<Info> selectInfoList(String animal, int page){
		
		PageInfo pi = Pagination.getPageInfo(infoService.selectListCount(animal), page, 12, 10);
		RowBounds rowBounds = new RowBounds(
				(pi.getCurrentPage() - 1) * pi.getBoardLimit(),
				pi.getBoardLimit()
				);
		
		List<Integer> boardNoList = infoService.selectBoardNoList(animal, rowBounds);
		// Info 리스트 초기화
		List<Info> infoList = new ArrayList<>();
		if (boardNoList != null && !boardNoList.isEmpty()) {
		    // 각 boardNo에 대해 Info 객체를 생성
		    for (Integer boardNo : boardNoList) {
		        Info info = infoService.selectInfoByBoardNo(boardNo);
		        // 각 Info 객체에 해당하는 attNo 리스트를 가져와서 설정
		        List<Attachment> attNoList = infoService.selectAttNoListByBoardNo(boardNo);
		        info.setAttachmentList(attNoList);
		        // PageInfo 설정
		        info.setPageInfo(pi);
		        
		        // 최종 리스트에 추가
		        infoList.add(info);
		    }
		}
		for(Info i : infoList) {
			i.setPageInfo(pi);
		}
		return infoList;
	}
	
	@GetMapping("infoDetail/{boardNo}")
	public ModelAndView infoDetail(@PathVariable int boardNo, HttpSession session, ModelAndView mv){
		
		infoService.selectInfoCount(boardNo);
			
		Info info = infoService.infoDetail(boardNo);
		session.setAttribute("info", info);
		mv.setViewName("info/infoDetail");
		return mv;
	}
	
	@GetMapping("addLikeCount/{boardNo}/{memberNo}")
	public int addLikeCount(@PathVariable int boardNo, @PathVariable int memberNo, ModelAndView mv) {
		HashMap<Object, Object> map = new HashMap();
		
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		int result = infoService.insertLike(map);
		int boardLike = 0;
		if(result > 0) {
			boardLike = infoService.selectLike(boardNo);
		};
		return boardLike;
	}
	
	@GetMapping("removeLikeCount/{boardNo}/{memberNo}")
	public int removeLikeCount(@PathVariable int boardNo, @PathVariable int memberNo, ModelAndView mv) {
		HashMap<Object, Object> map = new HashMap();
		
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		int result = infoService.deleteLike(map);
		int boardLike = 0;
		if(result > 0) {
			boardLike = infoService.selectLike(boardNo);
		};
		return boardLike;
	}
	
	@GetMapping("selectLike/{boardNo}")
	public int selectLike(@PathVariable int boardNo) {
		int	boardLike = infoService.selectLike(boardNo);
		return boardLike;
	}
	
	@GetMapping("selectReply/{boardNo}")
	public List<Reply> selectReply(@PathVariable int boardNo) {
		List<Reply> replyList = infoService.selectReply(boardNo);
		return replyList;
	}
	
	@GetMapping("insertComment/{replyNo}/{commentContent}/{memberNo}")
	public List<Comment> insertComment(@PathVariable int replyNo,
										@PathVariable String commentContent,
										@PathVariable int memberNo,
										HttpSession session){
		System.out.println(commentContent);
		System.out.println(replyNo);
		System.out.println(memberNo);
		Comment comment = new Comment();
		comment.setCommentContent(commentContent);
		comment.setMemberNo(memberNo);
		comment.setReplyNo(replyNo);
		List<Comment> commentList = new ArrayList();
		if(infoService.insertComment(comment) > 0 ) {
			session.setAttribute("alertMsg", "댓글이 등록되었습니다.");
			commentList = infoService.selectComment(replyNo);
			System.out.println(commentList);
		} else {
			session.setAttribute("alertMsg", "댓글 작성에 실패하였습니다..");
		}
		return commentList;
	}
	
	
	
	
	
	
	
	
	
	
	
}
