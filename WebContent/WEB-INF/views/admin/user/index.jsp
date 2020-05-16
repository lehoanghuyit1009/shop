<%@page import="com.itsontran.constant.MessageEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
<script type="text/javascript">
document.getElementById('user').classList.add('active');
</script>  
        <div class="page-head">
          <h2 class="page-head-title">User</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item active">User</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
      	  <c:if test="${not empty  eMsg}">
            <c:set var="alertClass" value="" />
            <c:set var="alertMessage" value="" />
            <!-- START với mỗi loại thông báo edit, add, delete thì có mỗi màu sắc cho alert riêng -->
      		<c:choose>
      	      <c:when test="${eMsg eq MessageEnum.MSG_ADD_SUCCESS}">
                <c:set var="alertClass" value="primary" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
      	      <c:when test="${eMsg eq MessageEnum.MSG_UPDATE_SUCCESS}">
                <c:set var="alertClass" value="success" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
      	      <c:when test="${eMsg eq MessageEnum.MSG_DELETE_SUCCESS}">
                <c:set var="alertClass" value="warning" />
                <c:set var="alertMessage" value="Success" />
      	      </c:when>
      	      <c:when test="${eMsg eq MessageEnum.MSG_ERROR}">
                <c:set var="alertClass" value="danger" />
                <c:set var="alertMessage" value="Error" />
      	      </c:when>
      		  <c:otherwise>
                <c:set var="alertClass" value="danger" />
                <c:set var="alertMessage" value="Error" />
      		  </c:otherwise>
      		</c:choose>
            <!-- END với mỗi loại thông báo edit, add, delete thì có mỗi màu sắc cho alert riêng -->
            
            <!-- START alert message when add, edit, delete success -->          
  		    <div class="row">
  		      <div class="col-sm-12">
  		        <div class="alert alert-${alertClass} alert-icon alert-icon-border alert-dismissible" role="alert">
                  <div class="icon"><span class="mdi mdi-check"></span></div>
                  <div class="message">
                    <button class="close" type="button" data-dismiss="alert" aria-label="Close">
                      <span class="mdi mdi-close" aria-hidden="true"></span>
                    </button>
                    <strong>${alertMessage}! </strong>${eMsg.status } 
                  </div>
                </div>
  		      </div>	
  		    </div>
            <!-- END alert message when add, edit, delete success -->     
      	  </c:if>
		  <div class="row mb-1">
		    <div class="col-sm-6">
              <a href="${pageContext.request.contextPath}/admin/user/add"><button class="btn btn-space btn-primary"><i class="icon icon-left mdi mdi-plus"></i>Add</button></a>
	       	  <button id="deleteSelected" class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
            </div>
            <div class="col-sm-6">
                <form class="row" action="${pageContext.request.contextPath}/admin/user/search" method="get">
                  <div class="col-8">
                    <input class="form-control form-control-sm" style="height: 31px;" name="name" id="" type="text" placeholder="Search">
                  </div>
                  <div class="col-2">
                    <button class="btn btn-space btn-primary" type="submit"><span class="icon icon-left mdi mdi-search"></span>Search</button>
                  </div>
                </form>
            </div>
		  </div>		
          <div class="row">
            <div class="col-sm-12">
              <div class="card card-table">
                <div class="card-header">User table
                </div>
                <div class="card-body">
                  <div class="table-responsive noSwipe">
                    <table class="table table-striped table-hover table-bordered" style="border: 1px solid #dee2e6;">
                      <thead>
                        <tr>
                          <th style="width:4%;">
                            <label class="custom-control custom-control-sm custom-checkbox">
                              <input id="checkAll" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                            </label>
                          </th>
                          <th style="width:10%;">Id</th>
                          <th style="width:10%;">Role</th>
                          <th style="width:10%;">Username</th>
                          <th style="width:10%;">Fullname</th>
                          <th style="width:10%;">Email</th>
                          <th style="width:10%;">Phone</th>
                          <th style="width:10%;">Address</th>
                          <th style="width:5%;">Active</th>
                          <th style="width:20%;">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${not empty listUsers}">
                            <c:forEach items="${listUsers}" var="itemUser">
                            
                              <!-- START Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                              <c:set var="rowClass" value="" />
                              <c:choose>
                                <c:when test="${itemUser.id == objUser.id}">
                                  <c:set var="rowClass" value="table-warning" />
                                </c:when>
                                <c:otherwise>
                                  <c:set var="rowClass" value="" />
                                </c:otherwise>
                              </c:choose>
                              <!-- END Tô màu cho row mà vừa thêm hoặc vừa sửa -->
                              
                              <tr class="${rowClass}">
                                <td>
                                  <label class="custom-control custom-control-sm custom-checkbox">
                                    <input value="${itemUser.id}" name="aRow" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
                                  </label>
                                </td>
                                <td class="cell-detail"><span>${itemUser.id}</span></td>
                                <td class="cell-detail"><span>${itemUser.role.name}</span></td>
                                <td class="cell-detail"><span>${itemUser.username}</span></td>
                                <td class="cell-detail"><span>${itemUser.fullname}</span></td>
                                <td class="cell-detail"><span>${itemUser.email}</span></td>
                                <td class="cell-detail"><span>${itemUser.phoneNumber}</span></td>
                                <td class="cell-detail"><span>${itemUser.address}</span></td>
                                <td class="cell-detail btn-active">
    		                    	<c:choose>
    		                    		<c:when test="${itemUser.enable == 1 }">
    		                    			<span id="activeUser-${itemUser.id }" class="active" onclick="activeUser(${itemUser.id}, ${itemUser.enable })">Active</span>
    		                    		</c:when>
    		                    		<c:otherwise>
    		                    			<span id="activeUser-${itemUser.id }" onclick="activeUser(${itemUser.id}, ${itemUser.enable })">Active</span>
    		                    		</c:otherwise>
    		                    	</c:choose>
                                 </td>
                                <td class="text-right">
                                  <a href="${pageContext.request.contextPath}/admin/user/edit/${itemUser.id}-${page}"><button class="btn btn-space btn-success"><i class="icon icon-left mdi mdi-edit"></i>Edit</button></a>
                                  <c:choose>
                                    <c:when test="${(fn:containsIgnoreCase(itemUser.username, 'admin')) and (itemUser.role.name eq 'ADMIN')}">
                                      <a href="javascript:void(0)" >
                                        <button disabled="disabled" class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
                                      </a>
                                    </c:when>
                                    <c:otherwise>
                                      <a href="${pageContext.request.contextPath}/admin/user/delete/${itemUser.id}" onclick="return confirm('Bạn có muốn xóa ${itemUser.username}')">
                                        <button class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
                                      </a>
                                    </c:otherwise>
                                  </c:choose>
                                </td>
                              </tr>
                            </c:forEach>
                          </c:when>
                          <c:otherwise>
                            <td class="cell-detail text-center" colspan="7"><span>Không user nào</span></td>
                          </c:otherwise>
                        </c:choose>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
		    <div class="col-sm-12 d-sm-flex justify-content-sm-center">
                <ul class="pagination">
                <c:if test="${not empty paginations}">
                
                  <c:choose>
                    <c:when test="${page == 1}">
                      <li class="page-item disabled"><a class="page-link" href="" aria-label="Previous"><span class="mdi mdi-chevron-left" aria-hidden="true"></span></a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/user/page-${page - 1}" aria-label="Previous"><span class="mdi mdi-chevron-left" aria-hidden="true"></span></a></li>
                    </c:otherwise>
                  </c:choose>
                
                  <c:forEach items="${paginations }" var="itemPagination">
                    <c:choose>
                      <c:when test="${itemPagination == page }">
                        <li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/admin/user/page-${itemPagination}">${itemPagination}</a></li>
                      </c:when>
                      <c:when test="${itemPagination == -1 }">
                        <li class="page-item disabled"><a class="page-link " href="">...</a></li>
                      </c:when>
                      <c:when test="${itemPagination == -2 }">
                        <li class="page-item disabled"><a class="page-link " href="javascript:void(0)">...</a></li>
                      </c:when>
                      <c:otherwise>
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/user/page-${itemPagination}">${itemPagination}</a></li>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                 
                  <c:choose>
                    <c:when test="${page == numberOfPages}">
                      <li class="page-item disabled"><a class="page-link" href="" aria-label="Next"><span class="mdi mdi-chevron-right" aria-hidden="true"></span></a></li>
                    </c:when>
                    <c:otherwise>
                      <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/user/page-${page + 1}" aria-label="Next"><span class="mdi mdi-chevron-right" aria-hidden="true"></span></a></li>
                    </c:otherwise>
                  </c:choose>
                  
                 </c:if>
                </ul>
            </div>
		  </div>
        </div>
