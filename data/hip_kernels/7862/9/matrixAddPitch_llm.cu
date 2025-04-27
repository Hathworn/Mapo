#include "hip/hip_runtime.h"
#include "includes.h"

#define HEIGHT 1024  // assuming HEIGHT is defined somewhere

__global__ void matrixAddPitch(int *a, int *b, int *c, int pitch) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate x index
    int idy = threadIdx.y + blockIdx.y * blockDim.y;  // Calculate y index

    if (idx >= pitch || idy >= HEIGHT) return;  // Boundary check

    int index = idy * pitch + idx;  // Calculate 1D index from 2D coordinates
    c[index] = a[index] + b[index];  // Perform matrix addition
}