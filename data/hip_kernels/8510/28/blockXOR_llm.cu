#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockXOR(int *size, const char *input, char *output, long *key) {
    // Calculate the global index
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    // Improved memory access by reading key to a register
    long keyVal = *key;
    // Check bounds and perform XOR operation
    if (ix * 8 < *size) {
        ((long *)output)[ix] = ((const long *)input)[ix] ^ keyVal;
    }
}