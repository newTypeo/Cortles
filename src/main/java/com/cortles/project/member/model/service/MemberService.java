package com.cortles.project.member.model.service;
import static com.cortles.project.common.JdbcTemplate.*;
import java.sql.Connection;

import com.cortles.project.member.model.dao.MemberDao;
import com.cortles.project.member.model.vo.Member;

public class MemberService {
	private final MemberDao memberDao = new MemberDao();
	
	
	/**
	 * 아이디로 회원 조회
	 */
	public Member findById(String memberId) {
		
		return null;
	}

	/**
	 * 회원가입 -종환
	 */
	public int signup(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.signup(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

}