#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiply_device (double *d_a, double *d_b, int dim) {

    // Declaration of required variables.
    double sum;

    // Retrieve the thread and block specific information.
    int i = threadIdx.x;

    // Begin Matrix Computation.
    for (int j = blockIdx.x; j < dim; j += gridDim.x) {
        sum = 0;
        for (int k = 0; k < dim; k++) {
            // Precompute index to avoid repeated calculations.
            int indexOffset = k * dim;
            double a = d_a[indexOffset + i];
            double b = d_a[indexOffset + j];
            sum += a * b;
        }
        // Store the result in d_b.
        d_b[i * dim + j] = sum;
    }
}