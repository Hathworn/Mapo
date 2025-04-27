#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function to use shared memory
__global__ void vecAdd(double *a, double *b, double *c, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    // Use shared memory for better memory access pattern
    __shared__ double shared_a[256];  // Adjust size as per maximum blockDim.x
    __shared__ double shared_b[256];  // Adjust size as per maximum blockDim.x

    if (id < n) {
        shared_a[threadIdx.x] = a[id]; // Load elements to shared memory
        shared_b[threadIdx.x] = b[id]; // Load elements to shared memory
        __syncthreads();               // Ensure all threads have loaded

        c[id] = shared_a[threadIdx.x] + shared_b[threadIdx.x]; // Perform computation
    }
}