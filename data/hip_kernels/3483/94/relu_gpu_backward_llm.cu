#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_backward(float *ingrad, float *outgrad, float *indata, int64_t N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to improve memory access efficiency
    __shared__ float indata_shared[BLOCK_SIZE];
    __shared__ float outgrad_shared[BLOCK_SIZE];
    
    if (tid < N) {
        indata_shared[threadIdx.x] = indata[tid];
        outgrad_shared[threadIdx.x] = outgrad[tid];
        __syncthreads(); // Ensure all threads have loaded their data
        
        // Perform computation using shared memory
        ingrad[tid] = indata_shared[threadIdx.x] > 0 ? outgrad_shared[threadIdx.x] : 0;
    }
}