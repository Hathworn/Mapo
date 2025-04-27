#include "hip/hip_runtime.h"
#include "includes.h"

#define tileSize 32

//function for data initialization
void initialization(double* M, double* N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the input data
void printInput(double* M, double* N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the output data
void printOutput(double* P_C, double* P_G, int arow, int bcol);

__global__ void matrixMultiplication(double* M, double* N, double* P, int widthAHeightB, int heightA, int widthB) {
    int row = blockIdx.y * tileSize + threadIdx.y;
    int col = blockIdx.x * tileSize + threadIdx.x;

    double temp = 0.0;
    __shared__ double Ms[tileSize][tileSize];
    __shared__ double Ns[tileSize][tileSize];

    for (int t = 0; t < (widthAHeightB + tileSize - 1) / tileSize; ++t) {
        if (row < heightA && (t * tileSize + threadIdx.x) < widthAHeightB)
            Ms[threadIdx.y][threadIdx.x] = M[row * widthAHeightB + t * tileSize + threadIdx.x];
        else
            Ms[threadIdx.y][threadIdx.x] = 0.0;

        if (col < widthB && (t * tileSize + threadIdx.y) < widthAHeightB)
            Ns[threadIdx.y][threadIdx.x] = N[(t * tileSize + threadIdx.y) * widthB + col];
        else
            Ns[threadIdx.y][threadIdx.x] = 0.0;

        __syncthreads();

        for (int i = 0; i < tileSize; ++i) {
            temp += Ms[threadIdx.y][i] * Ns[i][threadIdx.x];
        }

        __syncthreads();
    }

    if (row < heightA && col < widthB) {
        P[row * widthB + col] = temp;
    }
}