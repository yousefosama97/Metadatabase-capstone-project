menu = {
    1: {"name": 'espresso', "price": 1.99},
    2: {"name": 'coffee', "price": 2.50},
    3: {"name": 'cake', "price": 2.79},
    4: {"name": 'soup', "price": 4.50},
    5: {"name": 'sandwich', "price": 4.99}
}

def calculate_subtotal(order):
    """Calculates the subtotal of an order

    Args:
        order: list of dicts that contain an item name and price

    Returns:
        float: The sum of the prices of the items in the order
    """
    subtotal = 0.0

    for item in order:
        item_name = item['name']
        item_price = menu.get(item_name.lower(), {}).get('price', 0)
        subtotal += item_price

    return subtotal

def calculate_tax(subtotal):
    """Calculates the tax of an order

    Args:
        subtotal: the price to get the tax of

    Returns:
        float: The tax required of a given subtotal, which is 15% rounded to two decimals.
    """
    tax = subtotal * 0.15
    return round(tax, 2)

def summarize_order(order):
    """Summarizes the order

    Args:
        order: list of dicts that contain an item name and price

    Returns:
        tuple: A tuple containing the names of items in the order and the total cost (subtotal + tax).
    """
    # Step 1: Calculate subtotal
    subtotal = calculate_subtotal(order)

    # Step 2: Calculate tax
    tax = calculate_tax(subtotal)

    # Step 3: Calculate total (subtotal + tax)
    total = subtotal + tax
    total = round(total, 2)

    # Step 4: Create a list of names of all items in the order
    names = [item['name'] for item in order]

    return names, total

def print_order(order):
    print('You have ordered ' + str(len(order)) + ' items')
    items = [item["name"] for item in order]
    print(items)
    return order

def display_menu():
    print("------- Menu -------")
    for selection in menu:
        print(f"{selection}. {menu[selection]['name'] : <9} | {menu[selection]['price'] : >5}")
    print()

def take_order():
    display_menu()
    order = []
    while True:
        item = input('Select menu item number (from 1 to 5), or enter "done" to finish: ')
        if item.lower() == 'done':
            break
        item_number = int(item)
        if item_number in menu:
            order.append(menu[item_number])
        else:
            print("Invalid item number. Please try again.")

    return order

def main():
    order = take_order()
    print_order(order)

    subtotal = calculate_subtotal(order)
    print("Subtotal for the order is:", subtotal)

    tax = calculate_tax(subtotal)
    print("Tax for the order is:", tax)

    names, total = summarize_order(order)
    print("Items in the order:", names)
    print("Total for the order is:", total)

if __name__ == "__main__":
    main()
