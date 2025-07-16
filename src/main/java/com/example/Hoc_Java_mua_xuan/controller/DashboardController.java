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
            System.out.println("Không có user trong session → redirect về login");
            return "redirect:/auth/login";
        }

        System.out.println("Truy cập dashboard với role: " + user.getRole());

        // Trả về file JSP theo role
        if ("admin".equalsIgnoreCase(user.getRole())) {
            return "admin/dashboard";  // → /WEB-INF/view/admin/dashboard.jsp
        } else {
            return "client/dashboard"; // → /WEB-INF/view/client/dashboard.jsp
        }
    }
}
