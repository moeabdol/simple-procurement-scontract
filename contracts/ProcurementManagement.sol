pragma solidity ^0.5.10;
pragma experimental ABIEncoderV2;

contract ProcurementManagement {
    PurchaseOrder[] private purchaseOrders;

    struct PurchaseOrder {
        string name;
        address buyer;
        string rfp;
        string rfpDeadline;
        string bidType;
        address[] sellers;
        bool fulfilled;
    }

    function createPurchaseOrder(
        string memory name, address buyer, string memory rfp,
        string memory rfpDeadline, string memory bidType,
        address[] memory sellers
    ) public {
        PurchaseOrder memory po;
        po.name = name;
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

    function getPurchaseOrdersByBuyer(address buyer)
    public view returns (PurchaseOrder[] memory) {
        uint buyersPOCount;
        for (uint i = 0; i < purchaseOrders.length; i++) {
            if (purchaseOrders[i].buyer == buyer) {
                buyersPOCount++;
            }
        }

        PurchaseOrder[] memory pos = new PurchaseOrder[](buyersPOCount);
        uint counter;
        for (uint i = 0; i < purchaseOrders.length; i++) {
            if (purchaseOrders[i].buyer == buyer) {
                pos[counter++] = purchaseOrders[i];
            }
        }

        return pos;
    }
}
