#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divide_kernel(float *v, float *other, int n) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Use warp-level operations for improved parallelism
    if (x < n) {
        v[x] /= other[x];
    }
}