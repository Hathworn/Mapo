#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void aproximarPi(float *x, float *y, int *z) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Linearize thread index in x direction
    int idy = blockIdx.y * blockDim.y + threadIdx.y; // Linearize thread index in y direction
    int index = idx + idy * N; // Calculate global index

    // Optimize: Use a local variable to reduce global memory accesses
    if ((x[index] * x[index] + y[index] * y[index]) <= 1.0f) {
        atomicAdd(z, 1);
    }
}