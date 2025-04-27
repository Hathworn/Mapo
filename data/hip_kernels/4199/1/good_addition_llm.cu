#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized vector addition kernel
__global__ void good_addition(int *a, int *b, int *c, int len) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride
    for (int i = tid; i < len; i += stride) {  // Use stride loop to cover entire array
        c[i] = a[i] + b[i];  // Perform addition
    }
}