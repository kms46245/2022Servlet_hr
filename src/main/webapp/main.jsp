<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ page import='com.my.hr.service.LaborerService,com.my.hr.service.LaborerServiceImpl'%>
<%@ page import='com.my.hr.domain.Laborer,java.util.List, java.time.LocalDate' %>

<head>
<title></title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
<script>

<%
LaborerService laborerService = new LaborerServiceImpl();

List<Laborer> laborersDb = laborerService.getLaborers();
%>

function isVal(field) {
    let isGood = false
    let errMsg

    if(!field.val()) {
    	errMsg = ' 노동자를 선택하세요.'
    	
    	if(field.attr('placeholder') == ('노동자명'))
			   	errMsg = field.attr('placeholder') + '을(를) 입력하세요.' ;
		else if(field.attr('placeholder') == ('입사일'))
			   	errMsg = field.attr('placeholder') + ' 을(를) 입력하세요.';
    }
    
    else isGood = true

    if(!isGood) {
        $('#modalMsg').text(errMsg).css('color', 'red')
        $('#modalBtn').hide()
        $('#modal').modal()
    }

    return isGood
}


function listLaborers() {
	
    $('input').not(':radio').val('')
    $('#laborers').empty()

    if(<%=laborersDb.size() %> > 0) {
       const laborerArr = []
       
       <% for (Laborer laborer : laborersDb) { %>
       laborerArr.unshift(
            `<tr>
                <td><input type='radio' name='laborerId' id='laborerId'
                        value=<%=laborer.getLaborerId()%>></input></td>
                <td><%=laborer.getLaborerId()%></td>
                <td><%=laborer.getName()%></td>
                <td><%=laborer.getHireDate()%></td>
            <tr>`
       ) 
       <% } %>
       
       $('#laborers').append(laborerArr.join(''))
    }
    else $('#laborers').append(
        '<tr><td colspan=4 class=text-center>노동자가 없습니다.</td></tr>')
}

function init() {
	listLaborers()
	
	$('#addLaborerBtn').click(() => {
        if(isVal($('#laborerName')) && isVal($('#hireDate'))) {
        }
    })

    $('#fixLaborerBtn').click(() => {
        if(isVal($('#laborerId:checked')) &&
            isVal($('#laborerName')) && isVal($('#hireDate'))) {
        }
    })
	
	
    $('#delLaborerBtn').click(() => {
        if(isVal($('#laborerId:checked'))){
            $('#modalMsg').text('노동자를 삭제하시겠습니까?')
            $('#modalBtn').show()
            $('#modal').modal()
            
        }
    })

    $('#delLaborerOkBtn').click(() => {
    	laborerId = $('#laborerId:checked').val()
 	        	
    	location.href = "com/my/hr/laborerProcess/laborerDelProc.jsp?laborerId=" + laborerId
    	
        $('#modal').modal('hide') 	    
    })
	
    // load value to field
    $('#laborers').on({
        change() {
            console.log($('#laborerId').parent().next())
            $('#laborerName').val($(this).parent().siblings().eq(1).text())
            $('#hireDate').val($(this).parent().siblings().eq(2).text())
        }
    }, '#laborerId')
}

$(init)
</script>


<style>
#hireDate::before {
    content: attr(placeholder);
    width: 100%;
}

#hireDate:focus::before, #hireDate:valid::before{
    display: none;
}
</style>

</head>

<body>
	<div class='container'>
	    <div class='row'>
	        <div class='col'>
	            <header class='jumbotron p-2'>
	                <h1 class='text-center'>HR</h1>
	            </header>
	        </div>
	    </div>
	    <div class='row'>
	        <div class='col'>
	            <form>
	                <div class='row mb-3'>
	                    <div class='col-2'>
	                        <input type='text' class='form-control' placeholder='노동자명' id='laborerName' name='laborerName'/>
	                    </div>
	                    <div class='col-4'>
	                        <input type='date' class='form-control' placeholder='입사일' id='hireDate' name='hireDate' required/>
	                    </div>
	                    <div class='col'>
	                        <nav class='d-flex'>
			                	<button class='btn btn-success flex-fill mr-1' id='addLaborerBtn'
			                      	formaction='com/my/hr/laborerProcess/laborerAddProc.jsp' type='submit'>
			                    <i class='fas fa-plus'></i><span class='label d-none d-sm-inline'>추가</span>
			                    </button>
			                    <button class='btn btn-info flex-fill mr-1' id='fixLaborerBtn'
			                    	formaction='com/my/hr/laborerProcess/laborerFixProc.jsp' type='submit'>
			                    <i class='fas fa-edit'></i><span class='label d-none d-sm-inline'>수정</span>
			                    </button>
			                    <button type='button' class='btn btn-warning flex-fill' id='delLaborerBtn'>
			                    <i class='fas fa-trash-alt'></i><span class='label d-none d-sm-inline'>삭제</span>
			                    </button>       
	                        </nav>
	                    </div>
	                </div>
	                <div class='row'>
	                    <div class='col'>
	                        <table class='table'>
	                            <thead><tr><th></th><th>ID</th><th>이름</th><th>입사일</th></tr></thead>
	                            <tbody id='laborers'>
	                                <tr><td colspan='4' class='text-center'>노동자가 없습니다.</td></tr>  
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
	
	<div class='modal fade' tabindex='-1' id='modal'>
	    <div class='modal-dialog'>
	        <div class='modal-content'>
	            <div class='modal-header'>
	                <button type='button' class='close' data-dismiss='modal'>
	                    <span>&times;</span>
	                </button>
	            </div>
	            <div class='modal-body'>
	                <p id='modalMsg'></p>
	            </div>
	            <div class='modal-footer' id='modalBtn'>
	            	<form>
		                <button type='button' class='btn btn-secondary' data-dismiss='modal'>아니오</button>
		                <button type='button' onclick='location.href="com/my/hr/LaborerProc/laborerDelProc.jsp"' class='btn btn-primary' id='delLaborerOkBtn'>예</button>
		            </form>
	            </div>
	        </div>
	    </div>
	</div>
<body>