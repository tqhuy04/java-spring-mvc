package com.example.Hoc_Java_mua_xuan.service;

import com.example.Hoc_Java_mua_xuan.domain.User;
import com.example.Hoc_Java_mua_xuan.respository.*;

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
}
