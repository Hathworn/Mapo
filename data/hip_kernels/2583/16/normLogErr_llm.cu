#include "hip/hip_runtime.h"
#include "includes.h"

// filename: eeTanh.cu
// a simple CUDA kernel to square the elements of a matrix

extern "C" // ensure function name to be exactly "eeTanh"
{
}

__global__ void normLogErr(int N, int M, float *A, float *Y)
{
    // Optimize by calculating index only once
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < M)
    {
        int index = j * N + i;
        int L = N * M;

        // Use intrinsic functions for better performance
        float a = __expf(2.0f * A[index + L]);
        A[index] = a * (0.5f * Y[index] * Y[index] + 0.5f * A[index] * A[index] - A[index] * Y[index]);
        A[index + L] = 0.9189385332f - A[index + L];
    }
}