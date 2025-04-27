#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b) {
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Use blockIdx and blockDim for larger data
    c[i] = a[i] + b[i];  // Compute addition
}