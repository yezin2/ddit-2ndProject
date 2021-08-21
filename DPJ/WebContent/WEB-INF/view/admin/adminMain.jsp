<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/view/common/top.jsp"%>

<main>
    <div class="container-fluid">
        <h1 class="mt-4">관리자 메인 페이지</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">관리할 메뉴를 선택하세요.</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-4">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Member Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="<%=request.getContextPath()%>/userAll/listUserAllList.do">가입회원 및 블랙 리스트 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">Notice & FAQ</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="<%=request.getContextPath()%>/adminBoard/noticeGetAll.do">공지사항 및 자주 묻는 질문 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">Board Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">전체 게시판 관리</a>
<!--                         <a class="small text-white stretched-link" href="/admin/board.do">전체 게시판 관리</a> -->
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">Reply Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="<%=request.getContextPath()%>/comment/allList.do">전체 댓글 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Product Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">광고 상품 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">AD Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">광고 식당 현황 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">Statistical Data</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">통계 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-4">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">Code Management</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="<%=request.getContextPath() %>/group/list.do">전체 코드 관리</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
</main>

<%@include file="/WEB-INF/view/common/bottom.jsp"%>