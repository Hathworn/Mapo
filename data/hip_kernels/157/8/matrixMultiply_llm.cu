#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixMultiply(float *A, float *B, float *C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Calculate the row index
    int numRows = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate the column index
    int numColumns = blockIdx.x * blockDim.x + threadIdx.x;

    if (numRows < numCRows && numColumns < numCColumns) {
        float Cval = 0.0;
        
        // Optimize loop iteration conditions
        for (int k = 0; k < numAColumns; ++k) {
            Cval += A[numRows * numAColumns + k] * B[k * numBColumns + numColumns];
        }

        C[numRows * numCColumns + numColumns] = Cval;
    }
}