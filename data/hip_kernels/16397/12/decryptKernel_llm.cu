```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void decryptKernel(char* deviceDataIn, char* deviceDataOut, int n) {
    // Calculate global index
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x;

    // Conditional execution if index is within bounds
    if (index < n) {
        // Perform data operation
        deviceDataOut[index] = deviceDataIn[index] - 1;
    }
}