#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void additionMatricesKernel(int* d_a, int* d_b, int* d_c) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform element-wise addition if index is within bounds
    d_c[index] = d_a[index] + d_b[index];
}