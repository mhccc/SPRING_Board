<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<script type="text/javascript">

	filePath = '${filePath}';
	alert("FilePath : " + filePath);
    window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', filePath, '업로드를 완료했습니다.');
    
</script>