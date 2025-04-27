#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 100
#define GRID_SIZE 100
#define N GRID_SIZE * BLOCK_SIZE

__global__ void VectorAdd(int *A, int *B, int *C) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < N) { // Ensure within bounds
        C[x] = A[x] + B[x];
    }
}