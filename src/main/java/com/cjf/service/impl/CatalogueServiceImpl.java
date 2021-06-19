package com.cjf.service.impl;

import com.cjf.entity.Catalogue;
import com.cjf.entity.SysUser;
import com.cjf.mapper.CatalogueMapper;
import com.cjf.mapper.SysUserMapper;
import com.cjf.service.CatalogueService;
import com.cjf.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.reflect.generics.tree.Tree;

import javax.swing.tree.TreeNode;
import java.util.ArrayList;
import java.util.List;

@Service
public class CatalogueServiceImpl implements CatalogueService {

    @Autowired
    CatalogueMapper catalogueMapper;





    @Override
    public List<Catalogue> queryAllStaff() {

        List<Catalogue> catalogueList = catalogueMapper.getPid(0);
//        List<Catalogue> list1 = new ArrayList<>();
//
//        list1= catalogueMapper.getPid(cate.getId());
               for (Catalogue cate:catalogueList){
                   List<Catalogue> pid = catalogueMapper.getPid(cate.getId());
                   cate.setCatalog(pid);
               }
        System.out.println("一级目录"+catalogueList);

        return catalogueList;
    }

//    public <T extends TreeNode> List<T> bulid(List<T> treeNodes, Object root) {
//
//    List<T> trees = new ArrayList<>();
//
//    for (T treeNode : treeNodes) {
//
//            if (root.equals(treeNode.getParentId())) {
//           trees.add(treeNode);
//       }
//
//   for (T it : treeNodes) {
//           if (it.getParentId() == treeNode.getId()) {
//                   if (treeNode.getChildren() == null) {
//             treeNode.setChildren(new ArrayList<>());
//         }
//              treeNode.add(it);
//          }
//  }
//         }
//     return trees;
// }

}
