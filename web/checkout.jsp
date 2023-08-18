<%@page import="dao.ItemDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="controller.*"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
        <title>Check Out</title>
        <!-- CSS stylesheet -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
        <link rel="stylesheet" href="src/css/checkout.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/checkout/">
        <link rel="stylesheet" href="./src/css/style.css">

        <!-- Bootstrap core CSS -->
        <link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <nav class="navbar navbar-expand-lg p-0">
        <div class="container-fluid" style="max-height: 70px">
            <div class="nav-start">
                <button class="btn d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#sidebar"
                        aria-controls="offcanvasWithBothOptions"><i class="fa-solid fa-bars" style="color: white;"></i></button>
                <a class="navbar-brand" href="index.jsp"><img class="rounded" src="./src/img/logo.png" height="70" width="70" /><h3 style='display: inline-flex; color: white;'><%=getServletContext().getAttribute("companyname")%></h3></a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link h4" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link h4" href="ViewItem">Item</a>
                    </li>
                </ul>
                <div class="input-group d-flex flex-row-reverse">
                    <form class="d-flex" role="search" method="post" action="SearchItem">
                        <input class="form-control me-2 search" type="search" placeholder="Search" aria-label="Search" name="itemsearch">
                        <button class="btn search" type="submit"><i class="fas fa-search "></i></button>
                    </form>
                </div>
            </div>
            <%
                List<Loginuser> custList = (List) session.getAttribute("custList");
            %>

            <!-- User-->
            <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                <div class="d-flex float-end">
                    <li class="nav-item dropdown">
                        <a class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center">
                            <i class="text-white white fas fa-user-alt m-1 me-md-2"></i>
                            <% for (Loginuser user : custList) {%> 

                            <p class="text-white white d-none d-md-block mb-0"><%= user.getUsername()%></p>

                            <% }%>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="dropdown-item" href="UpdUserList"><i class="fas fa-user-alt mx-2" style="color: black;"></i> User Profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="MyOrders.jsp"><i class="fa-solid fa-file-invoice mx-2" style="color: black;"></i>My Orders</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item" href="Logout"><i class="fa-solid fa-arrow-right-from-bracket  mx-2" style="color: black;"></i>Logout</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="cart.jsp" class="border rounded py-1 px-3 nav-link d-flex align-items-center">
                            <i class="fas fa-shopping-cart m-1 me-md-2"></i>
                            <p class="d-none d-md-block mb-0">My cart</p>
                        </a>
                    </li>
                </div>
            </div>
            <!-- User-->
        </div>
    </nav>
    <!--navigation bar -->

    <!--side bar -->
    <div class="offcanvas-lg d-lg-none offcanvas-start" tabindex="-1" id="sidebar"
         aria-labelledby="offcanvasWithBothOptionsLabel">
        <div class="offcanvas-header">
            <form role="search">
                <input class="form-control me-2 search" type="search" placeholder="Search" aria-label="Search">
            </form>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebar"
                    aria-label="Close"><i class="fa-solid fa-xmark fa-xl" style="color: white;"></i></button>
        </div>
        <div class="offcanvas-body">
            <ul class="sidebar-nav m-0 p-0">
                <li class="sidenav-item py-2">
                    <a class="sidenav-link text-decotion-none" href="index.jsp">
                        <i class="fa-solid fa-house mx-2" style="color: white;"></i>
                        <span class="sidenav-content">
                            Home
                        </span>
                    </a>
                </li>
                <li class="sidenav-item py-2">
                    <a class="sidenav-link text-decotion-none" href="index.jsp">
                        <i class="fa-solid fa-shoe-prints mx-2" style="color: white;"></i>
                        <span class="sidenav-content">
                            Item
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</head>
<%    DecimalFormat df = new DecimalFormat("#.##");
    request.setAttribute("df", df);
    List<CartItem> cartItemList = (List<CartItem>) session.getAttribute("cartItemList");
    List<CartItem> cartProduct = null;
    int cartSize = cartItemList.size();
    if (cartItemList != null) {
        ItemDao pDao = new ItemDao();
        cartProduct = pDao.getCartProducts(cartItemList);
        double total = pDao.getTotalCartPrice(cartItemList);
        //double cartTotal = Double.parseDouble((total > 0) ? (new java.text.DecimalFormat("0.00")).format(total) : "0.00");
        String formattedTotal = String.format("%.2f", total);
        System.out.print("FORMAT=" + formattedTotal);
        request.setAttribute("total", total);
        request.setAttribute("formattedTotal", formattedTotal);
        request.setAttribute("cartItemList", cartItemList);
        //CartItem cart = new CartItem();
    }%>



<%
    ItemDao pDao = new ItemDao();
    double total = pDao.getTotalCartPrice(cartItemList);
    String Shipping = "RM 0";
    if (total - 25 >= 200) {
        Shipping = "RM25";
    }
    request.setAttribute("Shipping", Shipping);
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body class="bg-light">
    <form id="checkout-form" action="insertOrder2" method="POST" class="needs-validation" novalidate>
        <div class="container">

            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <br><br><h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Your cart</span>
                        <span class="badge badge-secondary badge-pill"><%= cartSize%></span>
                    </h4>
                    <% for (CartItem item : cartProduct) {%>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0"><%= item.getItemname()%></h6>
                                <small class="text-muted">${item.getDescription()}</small>
                            </div>
                            <span class="text-muted"><%String formattedSubtotal = String.format("%.2f", item.getItemSubtotal());%>
                                RM<%= formattedSubtotal%></span>
                        </li>

                        <% }%>
                    </ul>
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">Delivery Charge</h6>
                            <small class="mb-0 mt-0"style="font-size: 80%;">RM 200 and above,<br>
                                delivery charges will be free</small>
                        </div>
                        <span class="text-muted">RM 25</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Discount</h6>
                        </div>
                        <span class="text-success">-${Shipping}</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (RM)</span>
                        <strong>RM${formattedTotal}</strong>
                    </li>
                    </ul>

                    <br><h4 class="mb-3">Payment</h4>

                    <div class="d-block my-3">
                        <div class="custom-control custom-radio" >
                            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" data-toggle="collapse" data-target="#creditDiv">
                            <label class="custom-control-label" for="credit">Credit card</label>
                            <div id="creditDiv" class="panel-collapse collapse">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="cc-name">Name on card</label>
                                        <input type="text" class="form-control" id="cc-name" placeholder="Full name as displayed on card" required pattern="[a-zA-Z ]+" onblur="validateNameOnCard()">
                                        <div class="invalid-feedback">
                                            Please enter a valid name on card (letters and spaces only).
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="cc-number">Credit card number</label>
                                        <input type="text" class="form-control" id="cc-number" placeholder="Credit card number" required pattern="^4[0-9]{12}(?:[0-9]{3})?$|^5[1-5][0-9]{14}$" onblur="validateCreditCardNumber()">
                                        <div class="invalid-feedback">
                                            Please enter a valid Credit card number
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="cc-expiration">Expiration</label>
                                        <input type="text" class="form-control" id="cc-expiration" placeholder="MM/YY" required pattern="(0[1-9]|1[0-2])\/\d{2}" onblur="validateExpirationDate()">
                                        <div class="invalid-feedback">
                                            Expiration date is required and should be in the format MM/YY
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="cc-cvv">CVV</label>
                                        <input type="text" class="form-control" id="cc-cvv" placeholder="CVV" required pattern="\d+" onblur="validateCVV()">
                                        <div class="invalid-feedback">
                                            Please provide a valid CVV.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 custom-control custom-radio">
                            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" data-toggle="collapse" data-target="#BankDiv" >
                            <label class="custom-control-label" for="debit">Online Banking</label>
                            <div id="BankDiv" class="panel-collapse collapse">
                                <div class="col-md-12 mb-3 mt-3" >
                                    <input type="radio" name="bank" id="cimb-radio" onclick="redirectToCIMB()">
                                    <a href="#">
                                        <img src="https://play-lh.googleusercontent.com/A75cRWwhBX-txKmE6g1X4lF4MD_RgxgPopJ5eHklR5ON-B27pv5aryUPWYIO7s5_jWw=s180-rw" alt="cimb" width="50" height="40"></img>
                                    </a><label class="cimb">CIMB</label>
                                </div>
                                <div class="col-md-12">
                                    <input type="radio" name="bank" id="maybank-radio" onclick="redirectToMaybank()">
                                    <a href="#">
                                        <img src="https://www.lowyat.net/wp-content/uploads/2016/10/Maybank.png" alt="maybank" width="50" height="40" ></img>
                                    </a><label class="maybank">Maybank</label>
                                </div>
                            </div>
                            <!--                            <script>
                            function redirectToCIMB() {
                                window.location.href = "https://www.cimbclicks.com.my/clicks/#/";
                            }
                            
                            function redirectToMaybank() {
                                window.location.href = "https://www.maybank2u.com.my/home/m2u/common/login.do";
                            }
                            </script>-->

                        </div>
                        <div class="col-md-12 mb-3 custom-control custom-radio">
                            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" >
                            <label class="custom-control-label" for="paypal">Cash</label>
                        </div>
                        <div class="invalid-feedback">
                            Please select a payment method.
                        </div>
                        <script>
                            $('input[class="custom-control-input"]').on('click', function () {
                            var target = $(this).data('target');
                            $('.collapse').not(target).collapse('hide');
                            });
                        </script>
                    </div>


                </div>

                <div class="col-md-8 order-md-1">
                    <br><br><h4 class="mb-3">Billing address</h4>

                    <div class="row">
                        <div class="col-md-6 mb-3" >
                            <label for="firstName">First name</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value="" required pattern="[a-zA-Z ]+">
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Last name</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value="" required pattern="[a-zA-Z ]+">
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>
                    </div>

                    <!--                    <div class="mb-3">
                                            <label for="username">Username</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">@</span>
                                                </div>
                                                <input type="text" class="form-control" id="username" placeholder="Username" required>
                                                <div class="invalid-feedback" style="width: 100%;">
                                                    Your username is required.
                                                </div>
                                            </div>
                                        </div>-->

                    <div class="mb-3">
                        <label for="email">Email </label>
                        <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
                        <div class="invalid-feedback">
                            Please enter a valid email address for shipping updates.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                        <div class="invalid-feedback">
                            Please enter your shipping address.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                    </div>

                    <div class="row">
                        <div class="row">
                            <div class="col-md-5 mb-3">
                                <label for="country">Country</label>
                                <select class="custom-select d-block w-100" id="country" required onchange="updateStateDropdown()">
                                    <option value="">Choose...</option>
                                    <option value="US">United States</option>
                                    <option value="MY">Malaysia</option>
                                    <option value="SG">Singapore</option>
                                    <option value="JP">Japan</option>
                                    <option value="AU">Australia</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid country.
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="state">State/City</label>
                                <select class="custom-select d-block w-100" id="state" required>
                                    <option value="">Choose...</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please provide a valid state/city.
                                </div>
                            </div>


                            <script>
                                // Define the state/city options for each country
                                const stateOptions = {
                                "US": ["California", "New York", "Texas", "Florida"],
                                        "MY": ["Johor", "Kedah", "Kelantan", "Kuala Lumpur", "Melaka", "Negeri Sembilan", "Pahang", "Perak", "Perlis", "Penang", "Sabah", "Sarawak", "Selangor", "Terengganu"],
                                        "SG": ["Central Singapore", "North East Singapore", "North West Singapore", "South East Singapore", "South West Singapore"],
                                        "JP": ["Tokyo", "Osaka", "Kyoto", "Hiroshima", "Fukuoka"],
                                        "AU": ["New South Wales", "Victoria", "Queensland", "Western Australia", "South Australia"]
                                };
                                // Function to update the state dropdown options based on the selected country
                                function updateStateDropdown() {
                                const countryDropdown = document.getElementById("country");
                                const stateDropdown = document.getElementById("state");
                                // Get the selected country option value
                                const selectedCountry = countryDropdown.value;
                                // Clear the current state dropdown options
                                stateDropdown.innerHTML = "";
                                // If the selected country is Malaysia, display all states in Malaysia
                                if (selectedCountry === "MY") {
                                const allStates = stateOptions[selectedCountry];
                                for (let i = 0; i < allStates.length; i++) {
                                const stateOption = document.createElement("option");
                                stateOption.value = allStates[i];
                                stateOption.text = allStates[i];
                                stateDropdown.add(stateOption);
                                }
                                } else {
                                // Otherwise, display the state options for the selected country
                                const countryStates = stateOptions[selectedCountry];
                                for (let i = 0; i < countryStates.length;
                                i++
                                        ) {
                                const stateOption = document.createElement("option");
                                stateOption.value = countryStates[i];
                                stateOption.text = countryStates[i];
                                stateDropdown.add(stateOption);
                                }
                                }
                                }
                            </script>

                            <div class="col-md-3 mb-3">
                                <label for="zip">Zip</label>
                                <input type="text" class="form-control" id="zip" placeholder="42700" required pattern="\d+">
                                <div class="invalid-feedback">
                                    Please provide a valid Zip code.
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="mb-4">
                    <!--                    <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="save-info">
                                            <label class="custom-control-label" for="save-info">Save this information for next time</label>
                                        </div>-->
                    <hr class="mb-4">
                    <div id="alertContainer"></div>

                    <hr class="mb-4">
                    <button class="btn btn-primary btn-lg btn-block bg-black" type="submit" id="placeOrderBtn" onclick="validateAndSubmit(event)">Place Order</button>

                    <script>
                        function validateAndSubmit(event) {
                        event.preventDefault();
                        //alert("button clicked");
                        // Validate the form
                        const form = document.getElementById('checkout-form');
                        const isValid = form.checkValidity();
                        form.classList.add('was-validated');
                        // Redirect to the appropriate bank login page
                        const selectedBank = document.querySelector('input[id="debit"]:checked');
                        const selectedBank1 = document.querySelector('input[id="cimb-radio"]:checked');
                        const selectedBank2 = document.querySelector('input[id="maybank-radio"]:checked');
                        var checkBank = document.getElementById('debit').checked;
                        var checkBank1 = document.getElementById('cimb-radio').checked;
                        var checkBank2 = document.getElementById('maybank-radio').checked;
                        var paymentMethodElements = document.getElementsByName('paymentMethod');
                        var checkPayment = false;
                        for (var i = 0; i < paymentMethodElements.length; i++) {
                        if (paymentMethodElements[i].checked) {
                        checkPayment = true;
                        break;
                        }
                        }
                        const selectedPayment = document.querySelector('input[name="paymentMethod"]:checked');
                        if (isValid && selectedBank && selectedBank1) {
                        window.location.href = "./CIMB.jsp";
                        //alert("cimb selecteds");
                        } else if (isValid && selectedBank && selectedBank2) {
                        //alert("maybank selecteds");
                        window.location.href = "./maybank.jsp";
                        //window.location.href = "https://www.maybank2u.com.my/home/m2u/common/login.do";

                        } else if (checkBank && (!(checkBank1 || checkBank2))) {
                        var dangerAlert = document.createElement('div');
                        dangerAlert.className = 'alert alert-danger';
                        dangerAlert.setAttribute('role', 'alert');
                        dangerAlert.textContent = 'Please select a bank';
                        // Append the danger alert to a container element
                        var container = document.getElementById('alertContainer');
                        container.appendChild(dangerAlert);
                        form.classList.remove('was-validated');
                        //alert("checkpoint isValid= false");
                        isValid = false;
                        }
                        if (isValid) {
                        alert("checkpoint isValid");
                        $("#loadMe").modal({
                        backdrop: "static", //remove ability to close modal with click
                                keyboard: false, //remove option to close with keyboard
                                show: true //Display loader!
                        });
                        setTimeout(function() {
                        $("#loadMe").modal("hide");
                        }, 3500);
                        var form = document.createElement("form");
                        form.style.display = "none";
                        form.action = "/insertOrder2";
                        form.method = "POST";
                        // Append the form to the document body
                        document.body.appendChild(form);
                        // Delay the execution of the form submission
                        setTimeout(function() {

                        // Submit the form
                        form.submit();
                        }, 3500);
                        //showSwal('success-message');
                        //window.location.href = "./checkoutSuccess.jsp";
                        } else if (!checkPayment){
                        //alert('Please select payment method');
                        var dangerAlert = document.createElement('div');
                        dangerAlert.className = 'alert alert-danger';
                        dangerAlert.setAttribute('role', 'alert');
                        dangerAlert.textContent = 'Please select one payment method!';
                        // Append the danger alert to a container element
                        var container = document.getElementById('alertContainer');
                        container.appendChild(dangerAlert);
                        } else {
                        var dangerAlert = document.createElement('div');
                        dangerAlert.className = 'alert alert-danger';
                        dangerAlert.setAttribute('role', 'alert');
                        dangerAlert.textContent = 'Something went wrong, please check your input!';
                        // Append the danger alert to a container element
                        var container = document.getElementById('alertContainer');
                        container.appendChild(dangerAlert);
                        }
                        }

                    </script>

                    </br>
                </div>
            </div>

        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"></script>')</script>
<script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
crossorigin="anonymous"></script>
<script src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>
<script>
                        function validateCreditCardNumber() {
                        var ccNum = document.getElementById("cc-number").value.replace(/\D/g, '');
                        var ccNum = document.getElementById("cc-number").value.replace(' ', '');
                        if (ccNum === "") {
                        document.getElementById("cc-number").classList.remove("is-invalid");
                        document.getElementById("cc-number").classList.remove("is-valid");
                        return true;
                        }

                        if (ccNum.length < 13 || ccNum.length > 19) {
                        // Invalid length
                        document.getElementById("cc-number").classList.remove("is-valid");
                        document.getElementById("cc-number").classList.add("is-invalid");
                        return false;
                        } else {
                        document.getElementById("cc-number").classList.remove("is-invalid");
                        }
                        var sum = 0, doubleUp = false;
                        for (var i = ccNum.length - 1; i >= 0; i--) {
                        var curDigit = parseInt(ccNum.charAt(i));
                        if (doubleUp) {
                        if ((curDigit *= 2) > 9)
                                curDigit -= 9;
                        }
                        sum += curDigit;
                        doubleUp = !doubleUp;
                        }
                        if ((sum % 10) == 0) {
                        // Valid credit card number
                        document.getElementById("cc-number").classList.remove("is-invalid");
                        document.getElementById("cc-number").classList.add("is-valid");
                        return true;
                        } else {
                        // Invalid credit card number
                        document.getElementById("cc-number").classList.remove("is-valid");
                        document.getElementById("cc-number").classList.add("is-invalid");
                        return false;
                        }
                        }
</script>

<script>
    function validateExpirationDate() {
    var input = document.getElementById("cc-expiration").value;
    if (!input.match(/^(0[1-9]|1[0-2])\/([0-9]{2})$/)) {
    // Invalid format
    document.getElementById("cc-expiration").classList.remove("is-valid");
    document.getElementById("cc-expiration").classList.add("is-invalid");
    return false;
    }
    // Split the input into month and year
    var parts = input.split("/");
    var month = parseInt(parts[0], 10);
    var year = parseInt(parts[1], 10);
    // Validate that the month and year are valid
    if (year < new Date().getFullYear() - 2000 || month < 1 || month > 12) {
    // Invalid expiration date
    document.getElementById("cc-expiration").classList.remove("is-valid");
    document.getElementById("cc-expiration").classList.add("is-invalid");
    return false;
    }
    // Expiration date is valid
    document.getElementById("cc-expiration").classList.remove("is-invalid");
    document.getElementById("cc-expiration").classList.add("is-valid");
    return true;
    }
    function validateCVV() {
    // CVV should be a 3 or 4-digit number
    var cvvPattern = /^\d{3,4}$/;
    var cvv = document.getElementById("cc-cvv").value;
    if (cvvPattern.test(cvv)) {
    // CVV is valid
    document.getElementById("cc-cvv").classList.remove("is-invalid");
    document.getElementById("cc-cvv").classList.add("is-valid");
    return true;
    } else {
    // CVV is invalid
    document.getElementById("cc-cvv").classList.remove("is-valid");
    document.getElementById("cc-cvv").classList.add("is-invalid");
    return false;
    }
    }
</script>

<script>
    function validateNameOnCard() {
    if (nameOnCard == null) {
    document.getElementById("cc-name").classList.remove("is-invalid");
    }
    var nameOnCard = document.getElementById("cc-name").value.trim();
    if (nameOnCard.length > 0) {
    var regex = /^[a-zA-Z\s]*$/;
    if (!regex.test(nameOnCard)) {
    document.getElementById("cc-name").classList.remove("is-valid");
    document.getElementById("cc-name").classList.add("is-invalid");
    } else {
    document.getElementById("cc-name").classList.remove("is-invalid");
    document.getElementById("cc-name").classList.add("is-valid");
    }
    }
    }
</script>

<script>// Get all radio buttons with name "paymentMethod"
    var paymentRadios = document.getElementsByName('paymentMethod');
// Add event listener for each radio button
    paymentRadios.forEach(function (radio) {
    radio.addEventListener('click', function () {
    // If Credit card radio button is checked, make the input fields required

    if (document.getElementById('credit').checked) {
    document.getElementById('cc-name').setAttribute('required', '');
    document.getElementById('cc-number').setAttribute('required', '');
    document.getElementById('cc-expiration').setAttribute('required', '');
    document.getElementById('cc-cvv').setAttribute('required', '');
    } else if (document.getElementById('paypal').checked) {
    document.getElementById('credit').removeAttribute('required');
    document.getElementById('debit').removeAttribute('required');
    document.getElementById('cc-name').removeAttribute('required');
    document.getElementById('cc-number').removeAttribute('required');
    document.getElementById('cc-expiration').removeAttribute('required');
    document.getElementById('cc-cvv').removeAttribute('required');
    document.getElementById('cimb-radio').removeAttribute('required', '');
    document.getElementById('maybank-radio').removeAttribute('required', '');
    } else {
    // If Credit card radio button is not checked, remove the required attribute
    document.getElementById('cc-name').removeAttribute('required');
    document.getElementById('cc-number').removeAttribute('required');
    document.getElementById('cc-expiration').removeAttribute('required');
    document.getElementById('cc-cvv').removeAttribute('required');
    document.getElementById('paypal').removeAttribute('required');
    document.getElementById('debit').removeAttribute('required');
    document.getElementByName('paymentMethod').setAttribute('required', '');
    }
    });
    });</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
    function showSwal(type) {
    'use strict';
    if (type === 'success-message') {
    setTimeout(function () {
//                swal({
//                    title: 'Congratulations!',
//                    text: 'You successfully placed an order',
//                    type: 'success',
//                    buttons: {
//                        confirm: {
//                            text: "Continue",
//                            value: true,
//                            visible: true,
//                            className: "btn btn-primary"
//                        }
//                    }
//                }).then(function () {
    window.location.href = "./checkoutSuccess.jsp";
    }, 3500);
    } else {
    swal("Error occurred!");
    }
    }
</script>
<style id="INLINE_PEN_STYLESHEET_ID">

    /** SPINNER CREATION **/
    .loader {
        position: relative;
        text-align: center;
        margin: 15px auto 35px auto;
        z-index: 9999;
        display: block;
        width: 80px;
        height: 80px;
        border: 10px solid rgba(0, 0, 0, 0.3);
        border-radius: 50%;
        border-top-color: #000;
        animation: spin 1s ease-in-out infinite;
        -webkit-animation: spin 1s ease-in-out infinite;
    }
    @keyframes spin {
        to {
            -webkit-transform: rotate(360deg);
        }
    }
    @-webkit-keyframes spin {
        to {
            -webkit-transform: rotate(360deg);
        }
    }
    /** MODAL STYLING **/
    .modal-content {
        border-radius: 0px;
        box-shadow: 0 0 20px 8px rgba(0, 0, 0, 0.7);
    }
    .modal-backdrop.show {
        opacity: 0.75;
    }
    .loader-txt p {
        font-size: 13px;
        color: #666;
    }
    .loader-txt p small {
        font-size: 11.5px;
        color: #999;
    }
    #output {
        padding: 25px 15px;
        background: #222;
        border: 1px solid #222;
        max-width: 350px;
        margin: 35px auto;
        font-family: 'Roboto', sans-serif !important;
    }
    #output p.subtle {
        color: #555;
        font-style: italic;
        font-family: 'Roboto', sans-serif !important;
    }
    #output h4 {
        font-weight: 300 !important;
        font-size: 1.1em;
        font-family: 'Roboto', sans-serif !important;
    }
    #output p {
        font-family: 'Roboto', sans-serif !important;
        font-size: 0.9em;
    }
    #output p b {
        text-transform: uppercase;
        text-decoration: underline;
    }

</style>
<!-- Modal -->
<div class="modal fade" id="loadMe" tabindex="-1" role="dialog" aria-labelledby="loadMeLabel">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body text-center">
                <div class="loader"></div>
                <div clas="loader-txt">
                    <p>Processing...</p>
                </div>
            </div>
        </div>
    </div>
</div>




</body>

</html>