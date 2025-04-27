#include "hip/hip_runtime.h"
#include "includes.h"
/*CUDA 2-D Matrix Multiplication*/

#define TILE_WIDTH 16 // Optimize TILE_WIDTH for better performance
#define WIDTH 100

// main routine
__global__ void MatrixMul(float *A_d, float *B_d, float *C_d) {
    // Calculate global thread id for the 2D grid
    unsigned int col = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Initialize variable to accumulate the sum for C_d[row, col]
    float sum = 0.0f;

    // Perform the dot product for this element
    for (int k = 0; k < WIDTH; k++) {
        sum += A_d[row * WIDTH + k] * B_d[k * WIDTH + col];
    }

    // Write the result to the output matrix
    C_d[row * WIDTH + col] = sum;
}