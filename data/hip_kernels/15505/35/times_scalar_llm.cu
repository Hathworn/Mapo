#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void times_scalar(float *v, float other, int n) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[256];
    if (x < n) {
        tile[threadIdx.x] = v[x] * other;
    }
    __syncthreads();

    if (x < n) {
        v[x] = tile[threadIdx.x];
    }
}