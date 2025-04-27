#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kgauss64sum(int xrows, int xcols, double *x, double *xx) {
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride to simplify index calculation

    while (j < xcols) {
        int x0 = j * xrows;
        int x1 = x0 + xrows;
        double sum = 0.0;

        for (int i = x0; i < x1; i++) {
            sum += x[i] * x[i]; // Accumulate squared values
        }
        
        xx[j] = sum; // Write the result to output
        j += stride; // Move to the next column
    }
}