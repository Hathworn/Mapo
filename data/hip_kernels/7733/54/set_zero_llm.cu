#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero(float *A, float *I, int n, int i) {
    // Optimize by combining condition checks to reduce branching
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < n && y < n && x != i && y == i) {
        A[x * n + y] = 0;
    }
}