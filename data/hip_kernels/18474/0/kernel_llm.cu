#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(unsigned int rows, unsigned int cols, float* ddata, float* vdata, float* results) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    float dp = 0;
    
    // Use shared memory for faster access times compared to global memory
    extern __shared__ float shared_vdata[];
    
    // Load vdata into shared memory
    if (threadIdx.x < cols) {
        shared_vdata[threadIdx.x] = vdata[threadIdx.x];
    }
    __syncthreads();
    
    // Compute the dot product
    for (int i = 0; i < cols; i++) {
        dp += ddata[i * rows + tid] * shared_vdata[i];
    }
    
    // Store the result
    results[tid] = dp;
}