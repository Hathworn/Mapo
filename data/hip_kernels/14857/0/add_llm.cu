#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void add(int *a, int *b, int *c, int N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Use both blockIdx and threadIdx for proper indexing
    if (tid < N) {
        c[tid] = a[tid] + b[tid]; // Add vectors element-wise
    }
}