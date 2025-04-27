```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply_device(double *d_a, double *d_b, int dim) {
    // Retrieve the thread and block specific information.
    int i = threadIdx.x;
    int j_start = blockIdx.x;
    int j_stride = gridDim.x;

    // Begin Matrix Computation.
    for (int j = j_start; j < dim; j += j_stride) {
        double sum = 0.0; // Initialize sum inside the loop for each column
        for (int k = 0; k < dim; k++) {
            double a = d_a[k * dim + i]; // Load element from d_a
            double b = d_a[k * dim + j]; // Load corresponding element from d_a
            sum += a * b; // Accumulate product
        }
        d_b[i * dim + j] = sum; // Store computed sum in the result matrix
    }
}