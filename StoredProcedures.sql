-- GetMaxOrderedQuantity

DELIMITER //
CREATE PROCEDURE GetMaxOrderedQuantity()
BEGIN
    DECLARE max_quantity INT;
    
    SELECT MAX(quantity) INTO max_quantity FROM Orders;
    
    SELECT max_quantity AS 'MaxOrderedQuantity';
END//
DELIMITER ;
CALL GetMaxOrderedQuantity();

-------------------------------------------------------------

-- GetOrderDetail Prepared Statements

DELIMITER //
CREATE PROCEDURE GetOrderDetail(IN customerIdInput INT)
BEGIN
	SET @customerID = customerIdInput;
	SET @sql_query = CONCAT('
		SELECT order_id, quantity, total_cost
		FROM Orders
		WHERE customer_id = ', @customerID);
	PREPARE stmt FROM @sql_query;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

SET @id = 1; 
CALL GetOrderDetail(@id);

-------------------------------------------------------------

-- CancelOrder

DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderIdInput INT)
BEGIN
    DECLARE confirmation_msg VARCHAR(100);
    DELETE FROM Orders WHERE order_id = orderIdInput;
    SET confirmation_msg = CONCAT('Order ', orderIdInput, ' is cancelled');
    SELECT confirmation_msg AS 'Confirmation';
END//
DELIMITER ;

CALL CancelOrder(5);

-------------------------------------------------------------

--AddValidBooking

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookingDateInput DATE, IN tableNumberInput INT)
BEGIN
    DECLARE bookingStatus VARCHAR(100);
    DECLARE bookingExists INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO bookingExists
    FROM Bookings 
    WHERE booking_date = bookingDateInput AND table_number = tableNumberInput;
    IF bookingExists > 0 THEN
        SELECT CONCAT('Table ', tableNumberInput, ' is already booked - booking cancelled') INTO bookingStatus;
        ROLLBACK;
    ELSE
        INSERT INTO Bookings (customer_id, staff_id, booking_date, table_number)
        VALUES (1, 1, bookingDateInput, tableNumberInput); -- Replace customer_id and staff_id with actual values
        SELECT CONCAT('Table ', tableNumberInput, ' is available - booking confirmed') INTO bookingStatus;
        COMMIT;
    END IF;    
    SELECT bookingStatus AS 'Status';
END//
DELIMITER ;

Call addvalidbooking("2022-12-17",6);

-------------------------------------------------------------

-- AddBooking

DELIMITER //
CREATE PROCEDURE AddBooking(
    IN bookingIdInput INT,
    IN customerIdInput INT,
    IN staffIdInput INT,
    IN bookingDateInput DATE,
    IN tableNumberInput INT
)
BEGIN
    INSERT INTO Bookings (booking_id, customer_id, staff_id, booking_date, table_number)
    VALUES (bookingIdInput, customerIdInput, staffIdInput, bookingDateInput, tableNumberInput);
    SELECT 'New booking added' AS 'Status';
END//
DELIMITER ;
CALL AddBooking(9,3,1,"2022-12-30", 6);

-------------------------------------------------------------

-- UpdateBooking

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookingIdInput INT, IN bookingDateInput DATE)
BEGIN
    DECLARE rowCount INT;
    UPDATE Bookings
    SET booking_date = bookingDateInput
    WHERE booking_id = bookingIdInput;
    SELECT CONCAT('Booking ', bookingIdInput, ' updated') AS 'Confirmation';
END//
DELIMITER ;

Call UpdateBooking(9,"2022-12-17");

-------------------------------------------------------------

-- CancelBooking

DELIMITER //
CREATE PROCEDURE CancelBooking(IN bookingIdInput INT)
BEGIN
    DELETE FROM Bookings
    WHERE booking_id = bookingIdInput;    
    SELECT CONCAT('Booking ', bookingIdInput, ' cancelled') AS 'Confirmation';
END//
DELIMITER ;

call cancelbooking(9);