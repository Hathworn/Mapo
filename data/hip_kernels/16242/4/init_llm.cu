#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global memory access and avoid branching
__global__ void init(int* __restrict__ U, int* __restrict__ F, int* __restrict__ d, int startNode, size_t gSize) {
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (globalThreadId < gSize) {
        // Use a single initialization statement
        U[globalThreadId] = (globalThreadId == 0) ? 0 : 1;
        F[globalThreadId] = (globalThreadId == 0) ? 1 : 0;
        d[globalThreadId] = (globalThreadId == 0) ? 0 : INT_MAX;
    }
}