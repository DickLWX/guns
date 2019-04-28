/**
 * Copyright 2018-2020 stylefeng & fengshuonan (https://gitee.com/stylefeng)
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package cn.stylefeng.guns.modular.system.dao;

import cn.stylefeng.guns.modular.system.model.User;
import cn.stylefeng.roses.core.datascope.DataScope;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 管理员表 Mapper 接口
 * </p>
 *
 * @author stylefeng
 * @since 2017-07-11
 */
public interface UserMapper extends BaseMapper<User> {

    /**
     * 修改用户状态
     */
    int setStatus(@Param("userId") Integer userId, @Param("status") int status);

    /**
     * 修改密码
     */
    int changePwd(@Param("userId") Integer userId, @Param("pwd") String pwd);

    /**
     * 根据条件查询用户列表
     */
    List<Map<String, Object>> selectUsers(@Param("dataScope") DataScope dataScope, @Param("name") String name, @Param("beginTime") String beginTime, @Param("endTime") String endTime, @Param("deptid") Integer deptid);

    /**
     * 设置用户的角色
     */
    int setRoles(@Param("userId") Integer userId, @Param("roleIds") String roleIds);

    /**
     * 通过账号获取用户
     */
    User getByAccount(@Param("account") String account);

    /**
     * 插入用户积分表
     * @param userId
     * @param score
     * @param tempscore
     */
    @Insert("insert into sys_userscore(userid, score,tempscore) values(#{userId}, #{score}, #{tempscore})")
    void insertUserScore(@Param("userId")Integer userId, @Param("score") Integer score,@Param("tempscore") Integer tempscore);

    @Select("select grade from sys_getorder where userid = #{userId}")
    Integer selectGradeByUserId(@Param("userId")Integer userId);

    @Select("select ordernum from sys_getorder where userid = #{userId}")
    Integer selectOrderNumByUserId(@Param("userId")Integer userId);

    @Select("select score from sys_userscore where userid = #{userId}")
    Integer selectScoreByUserId(@Param("userId")Integer userId);

    @Select("select tempscore from sys_userscore where userid = #{userId}")
    Integer selectTempScoreByUserId(@Param("userId")Integer userId);
}