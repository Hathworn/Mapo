#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void rdiv_scalar_double(int n, int idx, float dx, float *dy, int incy, double *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride-based loop for better global memory access pattern
    while (i < n) {
        // Check conditions and perform division
        if (i >= idx && i % incy == 0) {
            result[i] = dx / dy[i];
        }
        // Increment index by total number of threads in the grid
        i += blockDim.x * gridDim.x;
    }
}