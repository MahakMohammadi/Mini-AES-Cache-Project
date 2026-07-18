# Mini-AES-Cache-Project

A VHDL implementation of a secure 16-bit Mini-AES encryption core integrated with a Direct-Mapped Cache.

The Mini-AES engine performs two rounds of encryption using SubBytes, ShiftRows, MixColumns, and AddRoundKey transformations. To enhance data security, the cache encrypts data before storage and transparently decrypts it during read operations, ensuring that internal memory contains only encrypted values.

The repository includes complete VHDL source code and testbenches demonstrating the functionality of both modules.
