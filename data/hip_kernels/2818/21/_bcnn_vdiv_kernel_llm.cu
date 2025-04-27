#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vdiv_kernel(int n, float *a, float *b, float *y) {
    // Compute the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to allow each thread to process multiple elements if necessary
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride) {
        y[i] = a[i] / b[i];  // Element-wise division
    }
}