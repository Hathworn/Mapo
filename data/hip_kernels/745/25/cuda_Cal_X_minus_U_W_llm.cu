#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_Cal_X_minus_U_W(float *Y, float *U, float *X, int *Weight, int nRows, int nCols) {
    unsigned int Tidx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int Tidy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Calculate global index only once
    unsigned int index = Tidx + Tidy * nCols;

    if (Tidx < nCols && Tidy < nRows) {
        // Directly compute without temporary variables
        float X_temp_U_temp = X[index] / (nRows * nCols) + U[index];

        float Y_temp = (1 - Weight[index]) * X_temp_U_temp;

        // Update global memory
        Y[index] = Y_temp;
        U[index] = X_temp_U_temp - Y_temp;
    }
}