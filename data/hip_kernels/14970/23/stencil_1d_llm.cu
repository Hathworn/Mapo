#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int n, double *in, double *out)
{
    // Allocate shared memory (optimize size using dynamic allocation if known at compile-time)
    __shared__ double temp[THREADS_PER_BLOCK + 2 * RADIUS];

    // Calculate global and local indices
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int localIndex = threadIdx.x + RADIUS;

    // Return if the global index is out of bounds
    if (globalIndex >= n) return;

    // Load center element and halos into shared memory
    temp[localIndex] = in[globalIndex];
    if (threadIdx.x < RADIUS) {
        if (globalIndex >= RADIUS)
            temp[localIndex - RADIUS] = in[globalIndex - RADIUS];
        if (globalIndex < n - THREADS_PER_BLOCK)
            temp[localIndex + THREADS_PER_BLOCK] = in[globalIndex + THREADS_PER_BLOCK];
    }

    // Sync threads to ensure all loads are complete
    __syncthreads();

    // Handle boundary conditions
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS)) {
        out[globalIndex] = (double) globalIndex * (2 * RADIUS + 1.0);
        return;
    }

    // Compute result using loaded shared memory
    double result = 0.0;
    for (int i = -RADIUS; i <= RADIUS; i++) {
        result += temp[localIndex + i];
    }

    // Store the result
    out[globalIndex] = result;
}