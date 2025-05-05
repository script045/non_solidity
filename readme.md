# M48: Part 11 Solidity
## M48.4 Function Visibility


functionVisibility or access modifier
- we have 4 types : public, private, intenal, external

when a function declreaded public it can be access from 

- inside the contract
- outside the contract
- derived contacts

```
contract ProductInventory{
    //Struct with mapping

    struct Product {
        string name;
        uint price;
        uint quantity;
        bool isAvailable;
    }

    // mapping from product id to product
    mapping (uint => Product) public products;
    uint public productCount;

    function addProduct(string memory _name, uint _price, uint _quantity ) public {
        productCount++;
        products[productCount] = Product(_name, _price, _quantity, true);
    }

    function getProduct(uint _productId) public view returns (string memory name, uint, bool){
        require(_productId <= productCount, "Product doesn't exist");
        
        Product memory product = products[_productId];
        return (product.name, product.price, product.isAvailable);
    }
}

```

