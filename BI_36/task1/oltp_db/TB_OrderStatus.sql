Create TABLE IF NOT Exists TB_OrderStatus
(
    OrderStatusID  INT         NOT NULL,
    OrderStatusName VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_OrderStatus PRIMARY KEY (OrderStatusID)
);
