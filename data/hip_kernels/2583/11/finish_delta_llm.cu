#include "hip/hip_runtime.h"
#include "includes.h"
// filename: eeTanh.cu
// a simple CUDA kernel to square the elements of a matrix

extern "C"   // ensure function name to be exactly "eeTanh"
{
}

__global__ void finish_delta(int N, int M, float *A, float *Y, float *out)
{
    // Calculate global thread index for x and y dimensions.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute flat index for row-major 2D grid.
    int index = j * N + i;

    // Ensure the thread is within bounds before performing operations.
    if (i < N && j < M)
    {
        // Compact and efficient sign computation.
        out[index] = copysignf(1.0, A[index] - Y[index]);
    }
}