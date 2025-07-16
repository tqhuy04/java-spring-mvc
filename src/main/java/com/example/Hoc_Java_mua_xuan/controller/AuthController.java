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

    // ======= Trang đăng nhập =======
    @GetMapping("/login")
    public String showLoginForm() {
        return "auth/login"; // → /WEB-INF/view/auth/login.jsp
    }

    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model
    ) {
        User user = userService.findByUsername(username).orElse(null);

        if (user == null || !user.getPassword().equals(password)) {
            model.addAttribute("error", "Sai tên đăng nhập hoặc mật khẩu");
            return "auth/login";
        }

        session.setAttribute("user", user);
        return "redirect:/dashboard";
    }

    // ======= Trang đăng ký =======
    @GetMapping("/register")
    public String showRegisterForm() {
        return "auth/register"; // → /WEB-INF/view/auth/register.jsp
    }

    @PostMapping("/register")
    public String handleRegister(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String phone,
            @RequestParam(defaultValue = "user") String role,
            Model model
    ) {
        if (userService.existsByUsername(username)) {
            model.addAttribute("error", "Tên đăng nhập đã tồn tại");
            return "auth/register";
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setAddress(address);
        user.setPhone(phone);
        user.setRole(role);

        userService.save(user);

        model.addAttribute("message", "Đăng ký thành công. Mời đăng nhập.");
        return "redirect:/auth/login";
    }

    // ======= Đăng xuất =======
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login";
    }
}
