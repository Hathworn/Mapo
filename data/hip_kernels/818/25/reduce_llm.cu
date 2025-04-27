#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(int *a, int *res) {
    __shared__ int cache[threadsPerBlock];
    
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    
    cache[cacheIndex] = a[tid];
    
    __syncthreads();
    
    // Use a more efficient loop with division instead of multiple if statements
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }
    
    if (cacheIndex == 0) {
        *res = cache[0];
    }
}