#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addMatrix(int *c, int *a, int *b) {
    // Compute global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int index = idy * blockDim.x * gridDim.x + idx;

    // Perform matrix addition
    c[index] = a[index] + b[index];
}