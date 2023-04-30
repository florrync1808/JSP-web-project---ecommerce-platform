package domain;

import java.io.Serializable;

public class Orders implements Serializable {

    private String orderId;
    private String staffId;
    private String customerId;
    private String paymentId;
    private String shippingAddress;
    private String recipientName;
    private String recipientContactNo;
    private String createdAt;
    
    public Orders() {
    }

  
    
}
