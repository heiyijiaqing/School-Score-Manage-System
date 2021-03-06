<%--
  Created by IntelliJ IDEA.
  User: 蒙太奇
  Date: 2021/1/4
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","姓名"))
                return false;
            return true;
        });

    });

</script>

<title>学生管理</title>


<div class="workingArea">
    <h1 class="label label-info" >学生管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>班级</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${thecs}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td>${c.classId}</td>
                    <td>${c.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${c.sex == 0}">女</c:when>
                            <c:when test="${c.sex == 1}">男</c:when>
                        </c:choose>
                    </td>
                    <td>${c.age}</td>
                        <%-- 					<td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>					 --%>
                        <%-- 					<td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>					 --%>
                    <td><a href="admin_student_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_student_delete?id=${c.id}"><span class=" 	glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">新增学生</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_student_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>班级id</td>
                        <td><input  id="classId" name="classId" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                    <tr>
                        <td>密码</td>
                        <td><input  id="password" name="password" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td><input  id="sex" name="sex" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>年龄</td>
                        <td><input  id="age" name="age" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>
