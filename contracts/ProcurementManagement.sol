pragma solidity ^0.5.10;
pragma experimental ABIEncoderV2;

contract ProcurementManagement {
    PurchaseOrder[] private purchaseOrders;

    struct PurchaseOrder {
        address buyer;
        string rfp;
        string rfpDeadline;
        string bidType;
        address[] sellers;
        bool fulfilled;
    }

    function createPurchaseOrder(
        address buyer, string memory rfp, string memory rfpDeadline,
        string memory bidType, address[] memory sellers) public {
        PurchaseOrder memory po;
        po.buyer = buyer;
        po.rfp = rfp;
        po.rfpDeadline = rfpDeadline;
        po.bidType = bidType;
        po.sellers = sellers;
        po.fulfilled = false;
        purchaseOrders.push(po);
    }

    function getPurchaseOrders() public view returns (PurchaseOrder[] memory) {
        return purchaseOrders;
    }
}
