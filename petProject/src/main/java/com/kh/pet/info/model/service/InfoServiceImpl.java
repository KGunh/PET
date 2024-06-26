package com.kh.pet.info.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.kh.pet.common.model.vo.Alert;
import com.kh.pet.common.model.vo.Attachment;
import com.kh.pet.info.model.dao.InfoMapper;
import com.kh.pet.info.model.vo.Comment;
import com.kh.pet.info.model.vo.Info;
import com.kh.pet.info.model.vo.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfoServiceImpl implements InfoService {

	private final InfoMapper infoMapper;
	
	public int selectListCount(String animal) {
		return infoMapper.selectListCount(animal);
	}

	public Info selectInfoByBoardNo(HashMap<Object, Object> map) {
		return infoMapper.selectInfoByBoardNo(map);
	}
	
	public List<Attachment> selectAttNoListByBoardNo(Integer boardNo) {
		return infoMapper.selectAttNoListByBoardNo(boardNo);
	}

	@Override
	public List<Integer> selectBoardNoList(String animal, RowBounds rowBounds) {
		return infoMapper.selectBoardNoList(animal, rowBounds);
	}

	@Override
	public Info infoDetail(int boardNo) {
		return infoMapper.infoDetail(boardNo);
	}

	@Override
	public int selectReplyListCount(int boardNo) {
		return infoMapper.selectReplyListCount(boardNo);
	}

	@Override
	public List<Reply> selectReplyNoList(int boardNo, RowBounds rowBounds) {
		return infoMapper.selectReplyNoList(boardNo, rowBounds);
	}

	@Override
	public List<Reply> selectCommentList(int replyNo) {
		return infoMapper.selectCommentList(replyNo);
	}

	@Override
	public int insertLike(HashMap<Object, Object> map) {
		return infoMapper.insertLike(map);
	}

	@Override
	public int selectLike(int boardNo) {
		return infoMapper.selectLike(boardNo);
	}

	@Override
	public int deleteLike(HashMap<Object, Object> map) {
		return infoMapper.deleteLike(map);
	}

	@Override
	public List<Reply> selectReply(int boardNo) {
		return infoMapper.selectReply(boardNo);
	}

	@Override
	public void selectInfoCount(int boardNo) {
		infoMapper.selectInfoCount(boardNo);
	}

	@Override
	public int insertComment(Comment comment) {
		return infoMapper.insertComment(comment);
	}

	@Override
	public List<Comment> selectComment(int replyNo) {
		return infoMapper.selectComment(replyNo);
	}

	@Override
	public int insertAlert(Alert alert) {
		return infoMapper.insertAlert(alert);
	}

	@Override
	public int likeCheckInfo(HashMap<Object, Object> map) {
		return infoMapper.likeCheckInfo(map);
	}

	@Override
	public int insertReply(Reply reply) {
		return infoMapper.insertReply(reply);
	}


	
}
