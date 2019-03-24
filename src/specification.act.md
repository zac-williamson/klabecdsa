```act
behaviour recoverSignature of SignatureRecovery
interface recoverSignature(bytes32 message, bytes32 r, bytes32 s, uint256 v)

iff
    VCallValue == 0

iff
    v < 256

iff
    VCallDepth < 1024

returns Int(#sender(#unparseByteStack(#padToWidth(32, #asByteStack(message))), v, #unparseByteStack(#padToWidth(32, #asByteStack(r))), #unparseByteStack(#padToWidth(32, #asByteStack(s)))))
```

