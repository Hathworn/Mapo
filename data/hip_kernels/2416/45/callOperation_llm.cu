#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperation(int *niz, int *res, int k, int n)
{
    // Use shared memory to store the value of k for faster access
    extern __shared__ int shared[];
    shared[0] = k;
    __syncthreads();

    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit if tid is out of bounds
    if (tid >= n) return;

    // Use the value from shared memory
    if (niz[tid] == shared[0]) {
        atomicAdd(res, 1);
    }
}