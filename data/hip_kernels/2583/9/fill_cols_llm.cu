#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"   // ensure function name to be exactly "eeTanh"
{

}

__global__ void fill_cols(int N, int M, float *X, float *V)
{
    // Calculate the index only once
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < M)
    {
        X[j * N + i] = V[j]; // Use pre-computed index
    }
}