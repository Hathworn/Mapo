#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to add a and b with thread index offset
__global__ void AplusB(int *ret, int a, int b) {
    // Using blockIdx.x and blockDim.x to support multiple blocks
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    ret[index] = a + b + index;
}