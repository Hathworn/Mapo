#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void invierte(float *a, float *b) {
    // Calculate global thread ID using block and thread indices
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure global thread index is within bounds
    if (id < N) {
        // Reverse index access for array a
        b[id] = a[N - 1 - id];
    }
}