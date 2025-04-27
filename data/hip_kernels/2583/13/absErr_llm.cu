#include "hip/hip_runtime.h"
#include "includes.h"
// filename: eeTanh.cu

extern "C"   // ensure function name to be exactly "eeTanh"
{

}

__global__ void absErr(int N, int M, float *A, float *Y)
{
    // Efficient flat indexing for 2D grid
    int index = blockIdx.y * blockDim.y * N + blockIdx.x * blockDim.x + threadIdx.y * N + threadIdx.x;

    // Use index if within bounds
    if (index < M * N)
    {
        A[index] = fabsf(__fsub_rn(A[index], Y[index]));
    }
}