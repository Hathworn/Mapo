#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel0(int n, float a, float *x, float *y) {
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index does not exceed boundaries
    if (i < n) {
        // Initialize x and y values at index i
        x[i] = 1.0f;
        y[i] = 2.0f;

        // Compute the result for y[i]
        y[i] = a * x[i] + y[i];
    }
}