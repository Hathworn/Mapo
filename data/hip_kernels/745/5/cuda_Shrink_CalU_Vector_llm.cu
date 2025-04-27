#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_Shrink_CalU_Vector(float *Y, float *U, float *X, float lambda, float *L1Weight, int nRows, int nCols, int nFilts) {
    unsigned int Tidx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int Tidy = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure threads are within bounds
    if (Tidx >= nCols || Tidy >= nRows) return;

    int nElements = nRows * nCols;
    for (int k = 0; k < nFilts; k++) {
        int index = Tidx + (Tidy + nRows * k) * nCols;

        // Consolidate repeated calculations outside loop
        float factor = 1.0f / nElements;
        float X_temp = X[index] * factor;
        float U_temp = U[index];
        float WLambda = lambda * L1Weight[k];

        float Y_temp = X_temp + U_temp;
        float absxV1 = fabsf(Y_temp) - WLambda;

        // Simplify sign and absolute calculations
        Y_temp = copysignf(fmaxf(absxV1, 0.0f), Y_temp);

        Y[index] = Y_temp;
        U[index] = U_temp + X_temp - Y_temp;
    }
}