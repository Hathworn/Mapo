```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void div(float *A, float *B, float *C, int nx, int ny) {
    // Calculate the global thread index for a 2D grid
    int idx_x = threadIdx.x + blockIdx.x * blockDim.x;
    int idx_y = threadIdx.y + blockIdx.y * blockDim.y;

    // Linear indexing considering 2D grid.
    int idx = idx_x * ny + idx_y;

    // Perform division only if within bounds
    if (idx_x < nx && idx_y < ny) {
        C[idx] = A[idx] / B[idx];
    }
}