#include "hip/hip_runtime.h"
#include "includes.h"
// Library Definition

// Constant Definition
#define PI 3.141592654
#define blocksize 32
#define Repetitions 8192

// Print matrix into standard output
void print(double * M, int cols, int rows);
void dot(double * a, double * b, double & c, int cols);
void Create_New_Matrix(double * M, double * New, int * vec, int p0, int pp, int nn);

/*
DEVICE FUNCTIONS
*/

// Optimized matrix multiplication kernel
__global__ void matrixMul(double * a, double * b, double * C, int cols, int rows, int cols2)
{
    // Using shared memory for efficient data reuse
    __shared__ double shared_a[blocksize][blocksize];
    __shared__ double shared_b[blocksize][blocksize];

    // Calculate row and column index
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    double sum = 0.0;

    // Loop over the tiles of the matrix
    for (int tileIdx = 0; tileIdx < (cols2 + blocksize - 1) / blocksize; ++tileIdx) {
        // Load elements into shared memory
        if (tileIdx * blocksize + threadIdx.y < cols2 && row < rows)
            shared_a[threadIdx.y][threadIdx.x] = a[row * cols2 + tileIdx * blocksize + threadIdx.x];
        else
            shared_a[threadIdx.y][threadIdx.x] = 0.0;

        if (tileIdx * blocksize + threadIdx.x < cols && col < cols)
            shared_b[threadIdx.y][threadIdx.x] = b[(tileIdx * blocksize + threadIdx.y) * cols + col];
        else
            shared_b[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        // Multiply the matrices
        for (int k = 0; k < blocksize; ++k) {
            sum += shared_a[threadIdx.y][k] * shared_b[k][threadIdx.x];
        }
        __syncthreads();  // Ensure memory coherence
    }

    // Write the result to the output matrix
    if (row < rows && col < cols) {
        C[row * cols + col] = sum;
    }
}