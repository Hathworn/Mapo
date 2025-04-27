#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void neg_float(int n, int idx, float *dy, int incy, float *result) {
    // Calculate the global index once
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a strided loop to cover all elements
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = -dy[i];
        }
        i += blockDim.x * gridDim.x;
    }
}