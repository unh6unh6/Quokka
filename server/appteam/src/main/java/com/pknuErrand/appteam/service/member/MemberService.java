package com.pknuErrand.appteam.service.member;

import com.pknuErrand.appteam.domain.member.Member;
import com.pknuErrand.appteam.domain.member.MemberFormDto;
import com.pknuErrand.appteam.repository.member.MemberRepository;
import jakarta.transaction.Transactional;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
@Transactional
public class MemberService{

    private final MemberRepository memberRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public MemberService(MemberRepository memberRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {

        this.memberRepository = memberRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    private void validateDuplicateMember(Member member) {
        if(memberRepository.findById(member.getId()) != null)
            throw new IllegalStateException("이미 존재하는 회원입니다.");
    }

    public void SignUpProcess(MemberFormDto memberFormDto) {
        String mail = memberFormDto.getMail();
        String department = memberFormDto.getDepartment();
        String name = memberFormDto.getName();
        String id = memberFormDto.getId();
        String pw = memberFormDto.getPw();
        String nickname = memberFormDto.getNickname();

        memberRepository.save(new Member(mail, department, name, id, bCryptPasswordEncoder.encode(pw), nickname, 0, "ROLE_ADMIN"));
    }
    public Member findMemberById(String id) {
        Member member = memberRepository.findById(id);
        return member;
    }

    public Member getLoginMember() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = (UserDetails)principal;
        String username = userDetails.getUsername();
        return findMemberById(username);
    }
}