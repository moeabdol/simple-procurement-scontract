pragma solidity ^0.5.10;
pragma experimental ABIEncoderV2;

contract ProcurementManagement {
    PurchaseOrder[] private purchaseOrders;

    struct PurchaseOrder {
        address buyer;
        address seller;
        string name;
        string rfp;
        bool fulfilled;
    }

    function createPurchaseOrder(address buyer, string memory name, string memory rfp) public {
        PurchaseOrder memory po;
        po.buyer = buyer;
        po.name = name;
        po.rfp = rfp;
        purchaseOrders.push(po);
    }

    function getPurchaseOrders() public view returns (PurchaseOrder[] memory) {
        return purchaseOrders;
    }
}
