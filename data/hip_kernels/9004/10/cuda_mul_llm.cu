#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_mul(int* A, int* B, int* C, int w)
{
    // Calculate global thread index
    int tx = blockDim.x * blockIdx.x + threadIdx.x;
    int ty = blockDim.y * blockIdx.y + threadIdx.y;

    if (tx < w && ty < w) { // Ensure tx and ty are within bounds
        int tid = w * ty + tx;
        int v = 0;

        for (int i = 0; i < w; i++)
        {
            int a = A[ty * w + i];
            int b = B[i * w + tx];
            v += a + b; // Calculate sum instead of multiplication
        }

        C[tid] = v;
    }
}