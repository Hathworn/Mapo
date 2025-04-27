#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* in, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= n) return;
    
    extern __shared__ int temp[];
    
    // Load data into shared memory
    temp[threadIdx.x] = in[gid];
    
    __syncthreads(); // Ensure all data is loaded before proceeding
    
    if (gid >= offset) {
        // Use shared memory to reduce global memory accesses
        in[gid] += temp[threadIdx.x - (gid >= blockDim.x ? offset : 0)];
    }
    
    // Store result back into global memory
    in[gid] = temp[threadIdx.x];
}