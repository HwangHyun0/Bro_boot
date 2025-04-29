package com.bro.web.repository;

import com.bro.web.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Integer> {

    // MEMBER_ID로 조회하는 메소드 추가
    Optional<Member> findByMemberId(String memberId);
}
