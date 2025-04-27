#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_kernel(const int n, const float alpha, float *y) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop unrolling for better performance
    for (; i < n; i += blockDim.x * gridDim.x * 4) {
        if (i < n) y[i] = alpha;
        if (i + blockDim.x * gridDim.x < n) y[i + blockDim.x * gridDim.x] = alpha;
        if (i + 2 * blockDim.x * gridDim.x < n) y[i + 2 * blockDim.x * gridDim.x] = alpha;
        if (i + 3 * blockDim.x * gridDim.x < n) y[i + 3 * blockDim.x * gridDim.x] = alpha;
    }
}