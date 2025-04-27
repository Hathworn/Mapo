#include "hip/hip_runtime.h"
#include "includes.h"

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

// Matrix transposition (Rows and Cols of M)

__global__ void matrixSum(const double * M1, const double * M2, double * Msum, double alpha, double beta, int rows, int cols)
{
    // Use shared memory to improve memory access performance
    __shared__ double M1_tile[blocksize][blocksize];
    __shared__ double M2_tile[blocksize][blocksize];

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < rows && col < cols) {
        // Load data into shared memory
        M1_tile[threadIdx.y][threadIdx.x] = M1[row + col * rows];
        M2_tile[threadIdx.y][threadIdx.x] = M2[row + col * rows];
        __syncthreads();

        // Perform computation using shared memory
        Msum[row + col * rows] = alpha * M1_tile[threadIdx.y][threadIdx.x] + beta * M2_tile[threadIdx.y][threadIdx.x];
    }
}