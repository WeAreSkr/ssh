<%@ page language="java" import="java.util.*" import="cap.bean.*" 
import="cap.dao.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)request.getSession().getAttribute("user");
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="<%=basePath %>index">JavaEE博客</a>
        </div>
     
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav">
            <li><a href="index">首页</a></li>
          </ul>
          
          <% if (null != u) { %>
          <ul class="nav navbar-nav">
            <li><a href="<%=basePath %>user/myblog?userId=<%=u.getId() %>">我的博客</a></li>
          </ul>
          
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">博客管理<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="<%=basePath %>article/manage?userId=<%=u.getId() %>"><i class="icon-cog"></i> 博文管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>category/manage?userId=<%=u.getId() %>"><i class="icon-cog"></i> 分类管理</a></li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath %>comment/manage?userId=<%=u.getId()%>"><i class="icon-cog"></i> 评论管理</a></li>
                </ul>
            </li>
          </ul>
          <% } %>
          
          <% if (null == u) { %>
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="Login.jsp" target="_blank">登录</a></li>
          	<li><a href="Register.jsp" target="_blank">注册</a></li>
          </ul>
          <% } else { %>
          <div class="pull-right">
                <ul class="nav pull-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<%=u.getUsername() %> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<%=basePath %>user/profile?id=<%=u.getId() %>"><i class="icon-cog"></i> 编辑个人信息</a></li>
                            <% if (u.getIsApplied() == true) { %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>user/bloginfo?userId=<%=u.getId() %>"><i class="icon-cog"></i> 编辑博客信息</a></li>
                            <% } %>
                            <li class="divider"></li>
                            <li><a href="<%=basePath %>logout"><i class="icon-off"></i> 登出</a></li>
                        </ul>
                    </li>
                </ul>
          </div>
          <% } %>
          
        </div>
      </div>
    </nav>
        
    <% if (null != u) { %>
	<div class="container">
		
		<div class="row col-md-12">
			<div class="col-md-12">
			   <div class="col-md-12">
					<ol class="breadcrumb">
		              <li><a href="<%=basePath%>article/manage?userId=<%=u.getId() %>">博文管理</a></li>
		              <li class="active">新建文章</li>
		            </ol>
	            </div>
	            
	            <form class="form-horizontal" name="add_artical_form" action="<%=basePath %>article/save" method="post">
	                <div class="col-md-6">
	                    <div class="form-group">
	                    <input type="hidden" name="userId" value=<%=u.getId() %>>
	                    <label for="title">标题</label>
	                    <input class="form-control" id="name" name="art.title" type="text" >
	                    </div>
	                    <div class="form-group">
	                    <label for="sys_category">系统分类</label>
	                        <select class="form-control"  id="subject" name="art.sysCategory.id">
	                    	  <s:iterator value="scgList" id="sc">	                   	
	                    		<option value="<s:property value="#sc.id"/>"><s:property value="#sc.categoryName"/></option>                       	
                            </s:iterator>                          
                            </select>
                         </div> 
                         <div class="form-group">  
                        <label for="category">个人分类</label>
                        	<select class="form-control" id="subject" name="art.category.id">
                            <s:iterator value="cgList" id="cg">
	                    		<option value="<s:property value="#cg.id"/>" selected><s:property value="#cg.categoryName"/></option>                         	
                               </s:iterator>
                        	</select>                       	
                        </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="art.summary"  placeholder="摘要" rows="5"></textarea>
	                </div>
	                
	                <div class="form-group">
	                    <textarea class="form-control" id="message" name="art.content"  placeholder="文章内容" rows="5"></textarea>
	                </div>
	                  
	                <div class="form-group">
	                    <button id="contact-submit" type="submit" class="btn btn-primary input-medium pull-right">保存</button>
	                </div>
	                </div>
	            </form>
	        </div>
		</div>
	</div>
	<% } %>
	
<jsp:include page="frame/Footer.jsp"></jsp:include>