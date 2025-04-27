#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int n, double *in, double *out)
{
    // Allocate shared memory for the computation
    __shared__ double temp[THREADS_PER_BLOCK + 2*(RADIUS)];

    // Calculate global and local indices
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int localIndex = threadIdx.x + RADIUS;

    // Early return if the global index is out of bounds
    if (globalIndex >= n) return;

    // Load elements into shared memory
    temp[localIndex] = in[globalIndex];
    
    // Load halo elements with boundary checks to avoid overflows
    if (threadIdx.x < RADIUS) {
        if (globalIndex >= RADIUS) {
            temp[localIndex - RADIUS] = in[globalIndex - RADIUS];
        }
        if (globalIndex < (n - RADIUS) && globalIndex + THREADS_PER_BLOCK < n) {
            temp[localIndex + THREADS_PER_BLOCK] = in[globalIndex + THREADS_PER_BLOCK];
        }
    }

    // Handle boundary conditions explicitly
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS)) {
        out[globalIndex] = (double)globalIndex * ((double)RADIUS * 2 + 1);
        return;
    }

    // Compute stencil operation
    double result = 0.0;
    for (int i = -RADIUS; i <= RADIUS; i++) {
        result += temp[localIndex + i];
    }

    // Write the result to the output array
    out[globalIndex] = result;
}