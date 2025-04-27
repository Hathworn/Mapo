#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _fill(int n, float val, float *x) {
    // Calculate the global index for the current thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Unroll the loop to improve performance
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        x[i] = val;
    }
}