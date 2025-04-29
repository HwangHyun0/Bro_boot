package com.bro.web.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity			
@Table(name = "TB_MEMBER") // DB 테이블명
@Getter
@Setter
@NoArgsConstructor
public class Member {

    @Id
    @Column(name = "MEMBER_NO")
    private Integer memberNo;

    @Column(name = "MEMBER_ID")
    private String memberId;

    @Column(name = "MEMBER_NM")
    private String memberNm;

    @Column(name = "MEMBER_PWD")
    private String memberPwd;

    @Column(name = "OUT_YN")
    private String outYn;

    @Column(name = "OUT_DTTM")
    private String outDttm;

    @Column(name = "SYS_REG_DTTM")
    private String sysRegDttm;

    @Column(name = "SYS_UPD_DTTM")
    private String sysUpdDttm;
	
}
