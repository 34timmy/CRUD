package ru.javarush.repository.custom;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.javarush.model.User;

import java.util.List;

/**
 * Created by Тимур on 21.02.2017.
 */
public interface UserRepositoryCustom {
    @Query(value = "SELECT * from User where User.name LIKE %:name%",nativeQuery = true)
    List<User> findByName(@Param("name")String name);
}
