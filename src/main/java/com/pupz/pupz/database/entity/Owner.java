package com.pupz.pupz.database.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.Date;
import java.util.List;


@Setter
@Getter
@Entity
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "owners")
public class Owner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "username")
    private String username;

    @Column(name = "name")
    private String name;

    @Column (name = "age")
    private Integer age;

    @Column(name = "country")
    private String country;


    @Column(name = "image_url")
    private String imageUrl;


    @OneToMany(mappedBy = "owner", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Dog> dogs;
}

