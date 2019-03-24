contract SignatureRecovery {
    function recoverSignature(bytes32, bytes32, bytes32, uint) external view returns (address) {
        assembly {
            mstore(0x00, calldataload(0x04))
            mstore(0x20, calldataload(0x64))
            mstore(0x40, calldataload(0x24))
            mstore(0x60, calldataload(0x44))
            if iszero(lt(calldataload(0x64), 256)) {
                revert(0x00, 0x00)
            }
            if iszero(
                staticcall(gas, 0x01, 0x00, 0x80, 0x00, 0x20)
            ) {
                revert(0x00, 0x00)
            }
            return(0x00, 0x20)
        }
    }
}