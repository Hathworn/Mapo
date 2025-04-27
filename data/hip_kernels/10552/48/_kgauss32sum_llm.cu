#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss32sum(int xrows, int xcols, float *x, float *xx) {
    // Calculate thread ID
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread ID is within bounds of xcols
    if (j < xcols) {
        int x0 = j * xrows;
        int x1 = x0 + xrows;
        double sum = 0.0;

        // Unroll loop for better performance
        for (int i = x0; i < x1; i++) {
            sum += x[i] * x[i];
        }
        
        xx[j] = sum;
    }
}