package com.example.Hoc_Java_mua_xuan.service;

import com.example.Hoc_Java_mua_xuan.domain.User;
import com.example.Hoc_Java_mua_xuan.respository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepo;

    public UserService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    public List<User> getAllUsers() {
        return userRepo.findAll();
    }

    public User save(User user) {
        return userRepo.save(user);
    }

    public void delete(Long id) {
        userRepo.deleteById(id);
    }

    public Optional<User> getById(Long id) {
        return userRepo.findById(id);
    }

    public Optional<User> findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    // Kiểm tra đăng nhập (không dùng mã hóa)
    public Optional<User> checkLogin(String username, String password) {
        return userRepo.findByUsername(username)
                .filter(user -> user.getPassword().equals(password));
    }
    public boolean existsByEmail(String email) {
    return userRepo.existsByEmail(email);
}

public User findByEmail(String email) {
    return userRepo.findByEmail(email).orElse(null);
}

}
