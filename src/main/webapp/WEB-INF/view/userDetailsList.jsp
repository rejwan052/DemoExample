<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th>Id</th>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Gender</th>
                                            <th>Country</th>
                                            <th>Address</th>
                                            <th>Occupation</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="userDetails" items="${userDetailsList}" varStatus="status">
                                        <tr class="odd gradeX">
                                            <td>${userDetails.id}</td>
                                            <td>${userDetails.firstName}</td>
                                            <td>${userDetails.lastName}</td>
                                            <td class="center">${userDetails.gender}</td>
                                            <td class="center">${userDetails.country}</td>
                                            <td class="center">${userDetails.address}</td>
                                            <td class="center">${userDetails.occupation}</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
</table>