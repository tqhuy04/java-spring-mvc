package com.example.Hoc_Java_mua_xuan.controller;

import com.example.Hoc_Java_mua_xuan.domain.User;
import com.example.Hoc_Java_mua_xuan.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import java.util.List;

@Controller
@RequestMapping("/admin/user") // Gốc URL là /admin/user
public class UserController {

    private final UserService userService;

    // Constructor injection
    public UserController(UserService userService) {
        this.userService = userService;
    }

    // Hiển thị form tạo user (GET)
    @GetMapping("/create")
    public String showCreateForm() {
        return "admin/user/create"; // → /WEB-INF/view/admin/user/create.jsp
    }

    //  Hiển thị danh sách user (GET)
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/list"; // bạn có thể tạo thêm list.jsp
    }

    //  Xử lý tạo user (POST)
    @PostMapping("/create")
    public String handleCreate(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String fullName,
            @RequestParam(required = false) String address,
            @RequestParam(required = false) String phone

    ) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setAddress(address);
        user.setPhone(phone);

        userService.save(user);

        return "redirect:/admin/user"; // sau khi tạo xong, quay lại danh sách
    }
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
    User user = userService.getById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " + id));
    model.addAttribute("user", user);
    return "admin/user/edit";
}
@PostMapping("/update/{id}")
public String updateUser(
        @PathVariable("id") Long id,
        @RequestParam String email,
        @RequestParam String password,
        @RequestParam String fullName,
        @RequestParam String address,
        @RequestParam String phone
) {
    User user = userService.getById(id)
        .orElseThrow(IllegalArgumentException::new);

    user.setEmail(email);
    user.setPassword(password);
    user.setFullName(fullName);
    user.setAddress(address);
    user.setPhone(phone);
    userService.save(user);
    return "redirect:/admin/user";
}
@GetMapping("/delete/{id}")
public String deleteUser(@PathVariable("id") Long id) {
    userService.delete(id);
    return "redirect:/admin/user";
}

}
