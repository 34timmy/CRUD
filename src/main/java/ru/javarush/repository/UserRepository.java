package ru.javarush.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import ru.javarush.model.User;
import ru.javarush.repository.custom.UserRepositoryCustom;

import java.awt.print.Pageable;
import java.util.List;

/**
 * Created by Тимур on 21.02.2017.
 */
public interface UserRepository extends JpaRepository<User,Integer>,UserRepositoryCustom {
}
