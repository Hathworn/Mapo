#include "hip/hip_runtime.h"
#include "includes.h"

#define N 128*256
#define THREADS_PER_BLOCK 256
#define N_BLOCKS N/THREADS_PER_BLOCK

// Optimize kernel to ensure it's executed only within valid index range
__global__ void add(int *a, int *b, int *c) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) { // Check to avoid out-of-bounds access
        c[index] = a[index] + b[index];
    }
}