#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void initKernel(double* data, int count, double val) {
    int ti = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop unrolling

    // Use loop unrolling for better memory access and coalescing
    for (int idx = ti; idx < count; idx += stride) {
        data[idx] = val;
    }
}