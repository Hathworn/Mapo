#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addArrayGPU(int* a, int* b, int* c, int n) {
    // Use blockIdx and blockDim to handle larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        c[i] = a[i] + b[i];
    }
}