#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x) ((x)*(x)) // x^2

__global__ void weighting_kernel_transposed(double const* matrices, double const* weights, double* results) {
    // Optimize index calculation using built-in variables
    int matrix_index = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    int weight_index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform weighted multiplication
    results[matrix_index] = matrices[matrix_index] * weights[weight_index];
}