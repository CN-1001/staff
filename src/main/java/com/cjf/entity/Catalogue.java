package com.cjf.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Catalogue {
    private Integer id;
    private Integer pid;
    private String name;


}
