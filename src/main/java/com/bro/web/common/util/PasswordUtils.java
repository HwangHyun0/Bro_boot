package com.bro.web.common.util;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtils {
	
	private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    // 🔹 비밀번호 해싱 (회원가입 시 사용)
    public static String hashPassword(String rawPassword) {
        return encoder.encode(rawPassword); // bcrypt 해싱
    }

    // 🔹 비밀번호 검증 (로그인 시 사용)
    public static boolean checkPassword(String rawPassword, String storedHashedPassword) {
        return encoder.matches(rawPassword, storedHashedPassword);
    }

}
