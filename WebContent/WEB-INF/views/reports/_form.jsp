<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>

    </div>
</c:if>
<label for="report_date">日付</label>
<br />
<input type="date" name="report_date"
    value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br />
<br />

<label for="name">氏名</label>
<br />
<c:out value="${sessionScope.login_employee.name}" />
<br />
<br />

<label for="title">タイトル</label>
<br />
<input type="text" name="title" value="${report.title}" />
<br />
<br />

<label for="title">出勤時間</label>
<br />
<input type="time" name="starttime" value="${report.confirmed_at}" />
<input type="time" name="finishtime" value="${report.finished_at}" />
<br />
<br />

<label for="content">内容</label>
<br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br />
<br />

<label for="start_time"></label>
<br />
<input type="time" name="start_time"
    value="<fmt:formatDate value='${report.start_time}' pattern='yyyy-MM-dd' />" />
<select name="admin_flag">
    <option value="1"
        <c:if test="${employee.admin_flag == 1}"> selected</c:if>>出勤</option>
    <option value="2"
        <c:if test="${employee.admin_flag == 2}"> selected</c:if>>退勤</option>
</select>
<br />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>