#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vec_add_kernel(float *c, float *a, float *b, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (i < n) {  // Ensure index is within bounds
        c[i] = a[i] + b[i];  // Perform vector addition
    }
}