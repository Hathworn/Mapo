#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_pow_kernel(int n, float *x, float a, float *y) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate with stride for all elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        y[i] = powf(x[i], a);  // Use powf for single precision
    }
}