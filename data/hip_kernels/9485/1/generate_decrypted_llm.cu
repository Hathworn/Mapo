#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_decrypted(int *pDataPointer, int *pRandomData, int *pEncryptedData, long long int pSize) 
{
    long long int index = blockIdx.x * blockDim.x + threadIdx.x;
    long long int numElements = pSize / sizeof(int);

    if (index < numElements) // Use < for better readability and to avoid boundary issues
    {
        pEncryptedData[index] = pDataPointer[index] ^ pRandomData[index]; // Use array syntax for clarity
    }
}