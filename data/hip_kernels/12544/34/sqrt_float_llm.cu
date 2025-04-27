#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sqrt_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid
    
    for (; i < n; i += stride) { // Use stride-based iteration
        if (i >= idx && i % incy == 0) {
            result[i] = sqrtf(dy[i]); // Compute square root
        }
    }
}