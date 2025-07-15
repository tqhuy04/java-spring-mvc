package com.example.Hoc_Java_mua_xuan.controller;

import com.example.Hoc_Java_mua_xuan.domain.User;
import com.example.Hoc_Java_mua_xuan.service.UserService;

import jakarta.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    // Trang đăng nhập
    @GetMapping("/login")
    public String showLoginForm() {
        return "auth/login"; // /WEB-INF/view/auth/login.jsp
    }

    // Xử lý đăng nhập
    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {
        User user = userService.findByEmail(email);

        if (user == null || !user.getPassword().equals(password)) {
            model.addAttribute("error", "Sai email hoặc mật khẩu");
            return "auth/login";
        }

        session.setAttribute("user", user);

        // Chuyển đến dashboard theo vai trò
        if ("admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/dashboard";
        } else {
            return "redirect:/dashboard";
        }
    }

    // Trang đăng ký
    @GetMapping("/register")
    public String showRegisterForm() {
        return "auth/register"; // /WEB-INF/view/auth/register.jsp
    }

    // Xử lý đăng ký
    @PostMapping("/register")
    public String handleRegister(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String fullName,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String phone,
            @RequestParam(defaultValue = "user") String role,
            Model model
    ) {
        if (userService.existsByEmail(email)) {
            model.addAttribute("error", "Email đã tồn tại");
            return "auth/register";
        }

        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setAddress(address);
        user.setPhone(phone);
        user.setRole(role);

        userService.save(user);

        model.addAttribute("message", "Đăng ký thành công. Mời đăng nhập.");
        return "redirect:/auth/login";
    }

    // Đăng xuất
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }
}

