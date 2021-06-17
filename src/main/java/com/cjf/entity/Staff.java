package com.cjf.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Staff {
    private int id;
    private String name;
    private String sex;
    private String phone;
    private String profession;
}
