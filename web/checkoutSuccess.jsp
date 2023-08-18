<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Loginuser"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Item"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="javax.persistence.EntityManager"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Successful</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .card {
                border: 1px solid #ced4da;
                border-radius: 10px;
                max-width: 400px;
                padding: 20px;
                text-align: center;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .success-icon {
                font-size: 10rem;
                color: #28a745;
                animation: zoom-in-out 1s ease-in-out;
            }

            .success-text {
                font-size: 2.5rem;
                color: #333;
                animation: slide-up 1s ease-in-out;
            }

            .success-message {
                margin-top: 3rem;
                animation: fade-in 1s ease-in-out;
            }

            @keyframes zoom-in-out {
                0% {
                    transform: scale(0);
                }
                50% {
                    transform: scale(1.2);
                }
                100% {
                    transform: scale(1);
                }
            }

            @keyframes slide-up {
                0% {
                    transform: translateY(50%);
                    opacity: 0;
                }
                100% {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            @keyframes fade-in {
                0% {
                    opacity: 0;
                }
                100% {
                    opacity: 1;
                }
            }
        </style>
    </head>
    <body>
        <div class="card-container">
            <div class="card">
                <i class="fas fa-check-circle success-icon"></i>
                <h1 class="success-text">Payment Successful!</h1>
                <div class="success-message">
                    <p>Thank you for your payment.</p>
                    <p>Your order will be processed and shipped shortly.</p>
                    <%
                        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment1PU"); // change to Assignment1PU
                        EntityManager em = emf.createEntityManager();

                        List<Loginuser> cust = (List) session.getAttribute("custList");

                        String custName = cust.get(0).getUsername();

                        TypedQuery<Loginuser> customerQuery = em.createNamedQuery("Loginuser.findByUsername", Loginuser.class).setParameter("username", custName);
                        Loginuser loginuser = customerQuery.getSingleResult();

                        TypedQuery<Orders> orderQuery = em.createNamedQuery("Orders.findByUserId", Orders.class).setParameter("userid", loginuser.getUserid());
                        List<Orders> orderList = orderQuery.getResultList();%>

<% 
    Orders newestOrder = orderList.get(orderList.size() - 1);  
    DateFormat targetDateFormat = new SimpleDateFormat("d MMM yyyy");
//    String orderDate = targetDateFormat.format(newestOrder.getOrderDate());

    // Calculate the date when the purchased item will reach the customer
    Calendar deliveryDate = Calendar.getInstance();
    deliveryDate.setTime(newestOrder.getOrderDate());
    deliveryDate.add(Calendar.DAY_OF_MONTH, 7);
    String itemDeliveryDate = targetDateFormat.format(deliveryDate.getTime());
%>      

<div>
    <!-- Some HTML code or other elements -->
</div>
<p>Order Id: <%= newestOrder.getOrderId() %></p>
<p>Estimated Delivery Date: <%= itemDeliveryDate %></p>



                    <a href="MyOrders.jsp" class="btn btn-outline-dark shadow-0 me-1">View Order</a>
                </div>
            </div>
        </div>
    </body>
</html>
