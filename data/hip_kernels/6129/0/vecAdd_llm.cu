#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA kernel. Each thread takes care of one element of c

float* internalBuffer;
int nBuf;

__global__ void vecAdd(float *a, float *b, float *c, int n)
{
    // Use shared memory to improve memory access efficiency
    extern __shared__ float shared_mem[];

    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (id < n) {
        shared_mem[threadIdx.x] = a[id];
        __syncthreads(); // Ensure all threads have loaded their data
        shared_mem[threadIdx.x] += b[id];
        __syncthreads(); // Ensure all additions are done
        c[id] = shared_mem[threadIdx.x]; // Write result back to global memory
    }
}