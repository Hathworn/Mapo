#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decryptKernel(char* deviceDataIn, char* deviceDataOut, int n, char *key, int keySize) {
    // Calculate thread index
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only valid indices
    if (index < n) {
        // Optimized access using variable for repeated computation
        char keyChar = key[index % keySize];
        deviceDataOut[index] = deviceDataIn[index] - keyChar;
    }
}