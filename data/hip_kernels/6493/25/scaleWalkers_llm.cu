#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scaleWalkers ( const int n, const float c, const float *a, float *d ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for optimization
    for (; i < n; i += stride) { // Use strided loop for better memory access
        d[i] = c * a[i]; // Perform scaling
    }
}