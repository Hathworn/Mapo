#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ int shared_in[];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data from global to shared memory
    shared_in[threadIdx.x] = in[i];
    __syncthreads();

    // Perform computation
    out[i] = shared_in[threadIdx.x] + 2;
}