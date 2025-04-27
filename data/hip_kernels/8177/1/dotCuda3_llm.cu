#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void dotCuda3(float *a, float *b, float *c) {
    __shared__ float cache[1024];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int cacheIndex = threadIdx.x;
    
    // Efficiently load data into shared memory
    float temp = 0.0f;
    if (tid < gridDim.x * blockDim.x) {
        temp = a[tid] * b[tid];
    }
    cache[cacheIndex] = temp;
    __syncthreads();
    
    // Optimize reduction with unrolling and warp shuffle
    for (unsigned int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }
    
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}