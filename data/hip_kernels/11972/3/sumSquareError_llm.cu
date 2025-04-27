#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void sumSquareError (int nBatch, int rbs, int rScale, int nCoeff, float *DA, float *CA, float *EA, float *SA)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nBatch)
    {
        const int daOffset = i * rbs * rScale * nCoeff;
        const int caOffset = i * nCoeff;
        const int eaOffset = i * rbs * rScale;

        float sum = 0.0f; // Local variable for sum square error
        for(int j = 0; j < rbs * rScale ; j++)
        {
            float fx = 0.0f;
            for(int k = 0; k < nCoeff ; k++)
            {
                fx += DA[daOffset + j + rbs * rScale * k] * CA[caOffset + k];
            }
            float error = EA[eaOffset + j] - fx;
            sum += error * error; // Accumulate sum of squared errors
        }
        SA[i] = sum; // Write back to global memory only once
    }
}