#include "hip/hip_runtime.h"
#include "includes.h"

#define tileSize 32

//function for data initialization
void initialization( double *M,  double *N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the input data
void printInput( double *M,  double *N, int arow, int acol, int brow,  int bcol);
//(for Debugging) prints out the output data
void printOutput( double *P_C,  double *P_G, int arow, int bcol);

//GPU kernel
__global__ void matrixMultiplication(double* M, double* N, double* P, int widthAHeightB, int heightA, int widthB) {
    // Calculate block-specific matrix starting points
    int Mstart = widthAHeightB * tileSize * blockIdx.y;
    int Nstart = tileSize * blockIdx.x;
    double temp = 0;

    // Allocate shared memory for tiles
    __shared__ double Ms[tileSize][tileSize];
    __shared__ double Ns[tileSize][tileSize];

    for (int m = Mstart, n = Nstart; m < Mstart + widthAHeightB; m += tileSize, n += tileSize * widthB) {
        // Load tiles into shared memory with bounds checking
        if (m + widthAHeightB * threadIdx.y + threadIdx.x < widthAHeightB * heightA) {
            Ms[threadIdx.y][threadIdx.x] = M[m + widthAHeightB * threadIdx.y + threadIdx.x];
        } else {
            Ms[threadIdx.y][threadIdx.x] = 0.0;
        }

        if (n + widthB * threadIdx.y + threadIdx.x < widthAHeightB * widthB) {
            Ns[threadIdx.y][threadIdx.x] = N[n + widthB * threadIdx.y + threadIdx.x];
        } else {
            Ns[threadIdx.y][threadIdx.x] = 0.0;
        }
        __syncthreads();

        // Perform computation on the tiles
        for (int i = 0; i < tileSize; ++i) {
            temp += Ms[threadIdx.y][i] * Ns[i][threadIdx.x];
        }
        __syncthreads();
    }

    // Write the computed value to the output matrix
    int row = blockIdx.y * tileSize + threadIdx.y;
    int col = blockIdx.x * tileSize + threadIdx.x;
    if (row < heightA && col < widthB) {
        P[widthB * row + col] = temp;
    }
}