#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(double *a, double *b, double *c, int n)
{
    // Using shared memory for better memory access performance
    extern __shared__ double shmem[];
    double *sh_a = shmem;                    // Shared memory for a
    double *sh_b = shmem + blockDim.x;       // Shared memory for b

    // Get our global thread ID and local thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Ensure global thread ID is within bounds and load inputs to shared memory
    if (id < n) {
        sh_a[tid] = a[id];
        sh_b[tid] = b[id];
    }

    __syncthreads(); // Synchronize threads

    // Calculate and write the result if within bounds
    if (id < n) {
        c[id] = sh_a[tid] + sh_b[tid];
    }
}