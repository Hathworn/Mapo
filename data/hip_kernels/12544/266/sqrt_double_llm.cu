#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqrt_double(int n, int idx, double *dy, int incy, double *result) {
    // Cache thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Loop unrolling and grid-stride loop
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            result[i] = sqrt(dy[i]);
        }
        i += gridSize;
    }
}