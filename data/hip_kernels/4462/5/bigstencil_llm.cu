#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory for coalescing reads
__global__ void bigstencil(int* in, int* out) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Allocate shared memory
    extern __shared__ int shared_in[];

    // Load data into shared memory
    shared_in[threadIdx.x] = in[i];
    __syncthreads();

    // Perform computation using shared memory and write to global memory
    out[i] = shared_in[threadIdx.x] + 2;
}