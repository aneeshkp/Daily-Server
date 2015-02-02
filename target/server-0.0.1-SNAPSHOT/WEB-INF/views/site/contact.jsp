<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>关于我们</title>
    <meta name="decorator" content="site"/>
</head>


<body>


<p>Want to get in touch with me? Fill out the form below to send me a message and I will try to get back to you within
    24 hours!</p>

<form name="sentMessage" id="contactForm" novalidate>
    <div class="row control-group">
        <div class="form-group col-xs-12 floating-label-form-group controls">
            <label>Name</label>
            <input type="text" class="form-control" placeholder="Name" id="name" required
                   data-validation-required-message="Please enter your name.">

            <p class="help-block text-danger"></p>
        </div>
    </div>
    <div class="row control-group">
        <div class="form-group col-xs-12 floating-label-form-group controls">
            <label>Email Address</label>
            <input type="email" class="form-control" placeholder="Email Address" id="email" required
                   data-validation-required-message="Please enter your email address.">

            <p class="help-block text-danger"></p>
        </div>
    </div>
    <div class="row control-group">
        <div class="form-group col-xs-12 floating-label-form-group controls">
            <label>Phone Number</label>
            <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required
                   data-validation-required-message="Please enter your phone number.">

            <p class="help-block text-danger"></p>
        </div>
    </div>
    <div class="row control-group">
        <div class="form-group col-xs-12 floating-label-form-group controls">
            <label>Message</label>
            <textarea rows="5" class="form-control" placeholder="Message" id="message" required
                      data-validation-required-message="Please enter a message."></textarea>

            <p class="help-block text-danger"></p>
        </div>
    </div>
    <br>

    <div id="success"></div>
    <div class="row">
        <div class="form-group col-xs-12">
            <button type="submit" class="btn btn-default">Send</button>
        </div>
    </div>
</form>


</body>

</html>
