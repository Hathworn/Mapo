#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

// Optimized global kernel function
__global__ void log_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Utilize stride loop for better occupancy
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = logf(dy[i]);
        }
    }
}