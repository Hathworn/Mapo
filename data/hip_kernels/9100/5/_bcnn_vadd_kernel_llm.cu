#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vadd_kernel(int n, float *a, float *b, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flattening computation of thread index
    while (i < n) { // Efficiently handle cases where n is greater than total threads
        y[i] = a[i] + b[i];
        i += blockDim.x * gridDim.x; // Use all available resources to cover large n
    }
}