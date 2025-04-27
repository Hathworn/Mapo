#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

// Optimized global kernel function for floor_double
__global__ void floor_double(int n, int idx, double *dy, int incy, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    
    // Loop with grid-stride to cover all elements
    for (; i < n; i += gridStride) {
        // Check index condition and stride
        if (i >= idx && i % incy == 0) {
            result[i] = floor(dy[i]);
        }
    }
}