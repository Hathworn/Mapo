#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _logpforw(int nrows, int ncols, float *y) {
    // Determine column index and range once
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    while (col < ncols) {
        int i0 = col * nrows;
        int i1 = i0 + nrows;

        // Initialize for reduction
        float ymax = y[i0];
        // Find the maximum value in the column
        for (int i = i0 + 1; i < i1; i++) {
            ymax = fmaxf(y[i], ymax); // Use fmaxf for potential better performance
        }

        // Subtract the maximum and compute sum of exponents
        float z = 0.0f;
        for (int i = i0; i < i1; i++) {
            y[i] -= ymax;
            z += expf(y[i]); // Use expf for single precision
        }

        // Compute the logarithm of the sum of exponents
        float logz = logf(z); // Use logf for single precision

        // Subtract logz to normalize
        for (int i = i0; i < i1; i++) {
            y[i] -= logz;
        }

        // Move to the next column in the grid stride loop
        col += stride;
    }
}