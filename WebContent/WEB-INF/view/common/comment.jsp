<%@page import="kr.or.ddit.comment.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	List<CommentVO> cv = (List<CommentVO>) request.getAttribute("commentList");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>댓글 영역 확인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	body{margin-top:20px;}

		.content-item {
		    padding:30px 0;
			background-color:#FFFFFF;
		}
		
		.content-item.grey {
			background-color:#F0F0F0;
			padding:50px 0;
			height:100%;
		}
		
		.content-item h2 {
			font-weight:700;
			font-size:35px;
			line-height:45px;
			text-transform:uppercase;
			margin:20px 0;
		}
		
		.content-item h3 {
			font-weight:400;
			font-size:20px;
			color:#555555;
			margin:10px 0 15px;
			padding:0;
		}
		
		.content-headline {
			height:1px;
			text-align:center;
			margin:20px 0 70px;
		}
		
		.content-headline h2 {
			background-color:#FFFFFF;
			display:inline-block;
			margin:-20px auto 0;
			padding:0 20px;
		}
		
		.grey .content-headline h2 {
			background-color:#F0F0F0;
		}
		
		.content-headline h3 {
			font-size:14px;
			color:#AAAAAA;
			display:block;
		}
		
		
		#comments {
		    box-shadow: 0 -1px 6px 1px rgba(0,0,0,0.1);
			background-color:#FFFFFF;
		}
		
		#comments form {
			margin-bottom:30px;
		}
		
		#comments .btn {
			margin-top:7px;
		}
		
		#comments form fieldset {
			clear:both;
		}
		
		#comments form textarea {
			height:100px;
		}
		
		#comments .media {
			border-top:1px dashed #DDDDDD;
			padding:20px 0;
			margin:0;
		}
		
		#comments .media > .pull-left {
		    margin-right:20px;
		}
		
		#comments .media img {
			max-width:100px;
		}
		
		#comments .media h4 {
			margin:0 0 10px;
		}
		
		#comments .media h4 span {
			font-size:14px;
			float:right;
			color:#999999;
		}
		
		#comments .media p {
			margin-bottom:15px;
			text-align:justify;
		}
		
		#comments .media-detail {
			margin:0;
		}
		
		#comments .media-detail li {
			color:#AAAAAA;
			font-size:12px;
			padding-right: 10px;
			font-weight:600;
		}
		
		#comments .media-detail a:hover {
			text-decoration:underline;
		}
		
		#comments .media-detail li:last-child {
			padding-right:0;
		}
		
		#comments .media-detail li i {
			color:#666666;
			font-size:15px;
			margin-right:10px;
		}

    </style>
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<body>
<section class="content-item" id="comments">
    <div class="container">   
    	<div class="row">
            <div class="col-sm-8">   
                
                
                <h3><%= %> Comments</h3>
                
                <!-- COMMENT 1 - START -->
                <div class="media">
                    <div class="media-body">
                        <ul class="list-unstyled list-inline media-detail pull-right">
                            <li><i class="fa fa-calendar"></i>27/02/2014</li>
                        </ul>
                        <h4 class="media-heading">John Doe</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
                <!-- COMMENT 1 - END -->
                
                <!-- COMMENT 1 - START -->
                <div class="media">
                    <div class="media-body">
                        <ul class="list-unstyled list-inline media-detail pull-right">
                            <li><i class="fa fa-calendar"></i>27/02/2014</li>
                        </ul>
                        <h4 class="media-heading">John Doe</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
                <!-- COMMENT 1 - END -->
                
                <!-- COMMENT 1 - START -->
                <div class="media">
                    <div class="media-body">
                        <ul class="list-unstyled list-inline media-detail pull-right">
                            <li><i class="fa fa-calendar"></i>27/02/2014</li>
                        </ul>
                        <h4 class="media-heading">John Doe</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
                <!-- COMMENT 1 - END -->
                
                <!-- COMMENT 1 - START -->
                <div class="media">
                    <div class="media-body">
                        <ul class="list-unstyled list-inline media-detail pull-right">
                            <li><i class="fa fa-calendar"></i>27/02/2014</li>
                        </ul>
                        <h4 class="media-heading">John Doe</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet.</p>
                    </div>
                </div>
                <!-- COMMENT 1 - END -->
                
                <form>
                	<h3 class="pull-left">댓글 달기</h3>
                	<button type="submit" class="btn btn-normal pull-right">등록</button>
                    <fieldset>
                        <div class="row">
                            <div class="form-group col-12">
                                <textarea class="form-control" id="message" placeholder="Your message" required=""></textarea>
                            </div>
                        </div>  	
                    </fieldset>
                </form>
            
            </div>
        </div>
    </div>
</section>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>