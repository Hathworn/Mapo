#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void MatrixMulKernel(double *OutMat, double *Mat1, double *Mat2, int Arows, int Acols, int Bcols) {
    // Obtain row and column indices
    int blockrow = blockIdx.y;
    int row = threadIdx.y;
    int blockcol = blockIdx.x;
    int col = threadIdx.x;

    // Declare shared memory
    __shared__ double subAshared[BLOCKSIZE][BLOCKSIZE];
    __shared__ double subBshared[BLOCKSIZE][BLOCKSIZE];
    double Cvalue = 0;

    // Improved loop conditions
    for (int B = 0; B < (Acols + BLOCKSIZE - 1) / BLOCKSIZE; B++) { 
        // Calculate indices
        int Mat1index = min(row + blockrow * BLOCKSIZE, Arows - 1) * Acols + col + B * BLOCKSIZE;
        int Mat2index = min(B * BLOCKSIZE + row, Acols - 1) * Bcols + blockcol * BLOCKSIZE + col;

        // Load data to shared memory with boundary check optimizations
        subAshared[row][col] = (Mat1index < Arows * Acols) ? Mat1[Mat1index] : 0.0;
        subBshared[row][col] = (Mat2index < Acols * Bcols) ? Mat2[Mat2index] : 0.0;

        __syncthreads();

        // Compute using shared memory
        for (int j = 0; j < BLOCKSIZE; j++) {
            Cvalue += subAshared[row][j] * subBshared[j][col];
        }

        __syncthreads();
    }
    // Store the result
    if (blockrow * BLOCKSIZE + row < Arows && blockcol * BLOCKSIZE + col < Bcols) {
        OutMat[(blockrow * BLOCKSIZE + row) * Bcols + (blockcol * BLOCKSIZE + col)] = Cvalue;
    }
}