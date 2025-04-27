#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero(double *A, double *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check only once if within bounds, reducing nested ifs
    if (x < n && y < n && x != i && y == i) {
        A[x * n + y] = 0;
    }
}