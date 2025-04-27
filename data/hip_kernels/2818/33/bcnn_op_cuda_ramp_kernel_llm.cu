#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_op_cuda_ramp_kernel(int n, float *x, float *y) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Stride for looping over array elements
    int stride = blockDim.x * gridDim.x;
    // Loop over elements to handle larger data sizes
    for (; i < n; i += stride) {
        y[i] = x[i] * (x[i] > 0) + 0.1 * x[i];
    }
}