package com.example.Hoc_Java_mua_xuan.controller;

import com.example.Hoc_Java_mua_xuan.domain.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/auth/login";
        }

        if ("admin".equalsIgnoreCase(user.getRole())) {
            return "admin/dashboard";
        }

        return "redirect:/product";
    }
}
