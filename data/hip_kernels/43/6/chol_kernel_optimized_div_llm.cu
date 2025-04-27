#include "hip/hip_runtime.h"
#include "includes.h"

// Use more blocks and threads for better parallelism
__global__ void chol_kernel_optimized_div(float * U, int k, int stride) {
    // General thread id
    int tx = blockIdx.x * blockDim.x + threadIdx.x;

    // Number of rows in the matrix
    unsigned int num_rows = MATRIX_SIZE;

    // Let only one thread compute the square root of the diagonal element
    if (tx == 0) {
        U[k * num_rows + k] = sqrtf(U[k * num_rows + k]); // Use sqrtf for better performance
    }

    // Calculate the starting point and step size for each thread
    int offset = (k + 1); // Offset for original loop
    int jstart = blockIdx.x * blockDim.x * stride + threadIdx.x * stride + offset;
    int jstep = gridDim.x * blockDim.x * stride; // Ensure all blocks work together

    // Upper and lower bounds on j for the loop
    int jtop = num_rows - 1;
    int jbottom = (k + 1);

    // Let all threads from all blocks perform division step
    for (unsigned int j = jstart; j <= jtop; j += jstep) {
        if (j >= jbottom) {
            U[k * num_rows + j] /= U[k * num_rows + k]; // Division step
        }
    }
}