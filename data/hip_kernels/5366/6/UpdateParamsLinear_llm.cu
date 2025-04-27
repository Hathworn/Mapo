#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateParamsLinear(float *dZ, float *A, int nRowsdZ, int nColsdZ, int nRowsA, float lr, float *W, float *b)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < nRowsdZ && col < nRowsA)
    {
        float dWValue = 0;
        for (int i = 0; i < nColsdZ; i++)
        {
            dWValue += dZ[row * nColsdZ + i] * A[col * nColsdZ + i];
        }
        W[row * nRowsA + col] -= lr * dWValue / nColsdZ; // Simplified update

        if (col == 0) // Only execute for the first column
        {
            float dbValue = 0;
            for (int i = 0; i < nColsdZ; i++)
            {
                dbValue += dZ[row * nColsdZ + i];
            }
            b[row] -= lr * dbValue / nColsdZ; // Simplified update
        }
    }
}