#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* __restrict__ in, int* __restrict__ out) {
    // Use shared memory for reduced global memory access latency
    extern __shared__ int s_data[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Load input data into shared memory
    s_data[threadIdx.x] = in[i];
    __syncthreads();
    
    // Perform computation using shared memory
    out[i] = s_data[threadIdx.x] + 2;
}