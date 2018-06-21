<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nav" uri="/pNavi-tags" %>
<script type="text/javascript" src="<c:url value='/resources/usr/js/freeCommon.js' />"></script> 
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate var="year" value="${now}" type="both" pattern="yyyy"/>
  
  <section class="board">
      <!-- 제목 : str -->
      <div class="subtitle">
        <hgroup>
          <h2>Network Statistics</h2>
          <h3>Check the traffic, internet speed, and the AC status here</h3>
        </hgroup>
      </div>
      <!-- 제목 : end -->

      <!-- 탭1============================================ : str -->
      <div id="tabs">
        <ul>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=trMonth">Traffic</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=spMonth">Internet Speed</a></li>
          <li><a href="${pageContext.request.contextPath }/adm/st/list?url=acMonth" class="hover">AC Monitoring</a></li>
        </ul>
    <form id="command">    
        <div id="tabs-1" class="topLine">
          <!-- 탭2 Traffic============================================ : str -->
          <span class="tab_topLine"></span>
          <section id="tab-container" class="stats">
            <ul>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=acMonth', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_month.gif' />" alt="" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=acDay', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_day_on.gif' />" alt="" /></a></li>
              <li><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=acTime', 'command', 'post');" class="tab"><img src="<c:url value='/resources/images/btn_time.gif' />" alt="" /></a></li>
            </ul>
            <section id="contents-2" class="topLine">
              <!-- Day : srt -->
              <div class="statsSchbox">
                <button type="button" class="statsSch" onclick="doSubmit('${pageContext.request.contextPath }/adm/st/list?url=acDay', 'command', 'post')"></button>
                  <select name="strMonth" class="Month" style="height: 24px;">
                    <c:forTokens var="i" items="01,02,03,04,05,06,07,08,09,10,11,12" delims=",">
		            	<option value="${i}" <c:if test="${requestMap.strMonth==i}">selected</c:if> >${i}</option>
		          	</c:forTokens>
                  </select>
                  <select name="strYear" class="Year2" style="height: 24px;">
                    <c:forEach var="i" begin="${year-5}" end="${year}">
						<option value="${i}" <c:if test="${requestMap.strYear==i}">selected</c:if> >${i}</option>
					</c:forEach>
                  </select>
              </div>
              <section class="scrollX">
                <table class="boardSch" summary="Month">
                  <colgroup>
                    <col width="80" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="70" />
                    <col width="*" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th rowspan="2">Sort</th>
                      <th colspan="3">CPU</th>
                      <th colspan="3">Memory</th>
                      <th colspan="3" class="end">DISK</th>
                    </tr>
                    <tr>
                      <th>CRITICAL</th>
                      <th>MAJOR</th>
                      <th>MINOR</th>
                      <th>CRITICAL</th>
                      <th>MAJOR</th>
                      <th>MINOR</th>
                      <th>CRITICAL</th>
                      <th>MAJOR</th>
                      <th class="end">MINOR</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="result" items="${list}" varStatus="status">
                    <tr>
                      <th><a href="javascript:doSubmit('${pageContext.request.contextPath }/adm/st/list?url=acTime&strDay=${fn:substring(result.END_DAILY,6,8)}', 'command', 'post');">${fn:substring(result.END_DAILY,4,6)}/${fn:substring(result.END_DAILY,6,8)}<em>(${fn:substring(result.DAYNAME,0,3)})</em></a></th>
                      <td><c:if test="${result.CPU_CRITICAL==null}">0</c:if><fmt:formatNumber value="${result.CPU_CRITICAL}" type="number"/></td>
                      <td><c:if test="${result.CPU_MAJOR==null}">0</c:if><fmt:formatNumber value="${result.CPU_MAJOR}" type="number"/></td>
                      <td><c:if test="${result.CPU_MINOR==null}">0</c:if><fmt:formatNumber value="${result.CPU_MINOR}" type="number"/></td>
                      <td><c:if test="${result.MEMORY_CRITICAL==null}">0</c:if><fmt:formatNumber value="${result.MEMORY_CRITICAL}" type="number"/></td>
                      <td><c:if test="${result.MEMORY_MAJOR==null}">0</c:if><fmt:formatNumber value="${result.MEMORY_MAJOR}" type="number"/></td>
                      <td><c:if test="${result.MEMORY_MINOR==null}">0</c:if><fmt:formatNumber value="${result.MEMORY_MINOR}" type="number"/></td>
                      <td><c:if test="${result.DISK_CRITICAL==null}">0</c:if><fmt:formatNumber value="${result.DISK_CRITICAL}" type="number"/></td>
                      <td><c:if test="${result.DISK_MAJOR==null}">0</c:if><fmt:formatNumber value="${result.DISK_MAJOR}" type="number"/></td>
                      <td class="end alignC"><c:if test="${result.DISK_MINOR==null}">0</c:if><fmt:formatNumber value="${result.DISK_MINOR}" type="number"/></td>
                    </tr>
                    </c:forEach>
                    <!-- 
                    <tr class="bottomLine">
                      <th><a href="#">2/28<em>(Thu)</em></a></th>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td><a href="#">15,000</a></td>
                      <td class="end alignC"><a href="#">15,000</a></td>
                    </tr>
                     -->
                  </tbody>
                </table>
                <p class="unit">(unit: EA)</p>
              </section>
              <div class="excelDown unit">
                <div class="alignCenter">
                  <div class="button1 type2">
                    <a href="javascript:doExcelFileDownSubmit('${pageContext.request.contextPath }/adm/st/list?url=acDay&downExcel=Y', 'command', 'post');"><img src="<c:url value='/resources/images/btn_icon_excel.gif' />" alt="icon" /><span>Download Excel</span></a>
                  </div>
                </div>
              </div>
              <!-- Day : end -->
            </section>

          </section>
          <!-- 탭2 Traffic=========================================== : end -->
        </div>

      <!-- 탭1=========================================== : end -->
    </form>
    </section>