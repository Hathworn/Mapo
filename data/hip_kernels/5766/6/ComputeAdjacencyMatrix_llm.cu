#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeAdjacencyMatrix(float* dOut, int* nn, int n, int k)
{
    // Calculate global thread ID
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (col < n)
    {
        int* nnCol = &nn[col * n];
        int baseIndex = col * n;
        for (int i = 0; i < k; ++i)
        {
            int neighborIdx = nnCol[i];
            int idx1 = baseIndex + neighborIdx;
            int idx2 = neighborIdx * n + col;
            // Set adjacency matrix entries
            dOut[idx1] = 1.0f;
            dOut[idx2] = 1.0f;
        }
    }
}