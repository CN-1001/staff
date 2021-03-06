package com.cjf.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Catalogue implements Serializable {
    private String id;
    private String pid;
    private String name;
    private String path;

   private List<Catalogue> catalog;


}
