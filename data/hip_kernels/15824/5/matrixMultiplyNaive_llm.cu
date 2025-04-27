#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiplyNaive(float * A, float * B, float * C, int N, int K, int M)
{
    int Row = blockDim.y * blockIdx.y + threadIdx.y; // Calculate Row index for the thread
    int Col = blockDim.x * blockIdx.x + threadIdx.x; // Calculate Col index for the thread

    // Check if the thread is within matrix bounds
    if (Row < N && Col < M)
    {
        float Cvalue = 0.0f;
        // Optimize loop by using local variable as temporary storage
        for (int k = 0; k < K; ++k)
        {
            Cvalue += A[Row * K + k] * B[k * M + Col];
        }
        C[Row * M + Col] = Cvalue; // Store result in global memory
    }
}