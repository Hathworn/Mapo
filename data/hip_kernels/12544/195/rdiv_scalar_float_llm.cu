#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void rdiv_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Use stride for better memory coalescing

    for (; i < n; i += stride) { // Combined loop condition in declaration
        if (i >= idx && i % incy == 0) {
            result[i] = dx / dy[i]; // Perform division
        }
    }
}