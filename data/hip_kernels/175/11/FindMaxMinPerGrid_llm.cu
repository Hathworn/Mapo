#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMaxMinPerGrid(int p_nGridSize, int p_nEigNum, float* p_devMax, float* p_devMin, float* p_devReduceMax, float* p_devReduceMin, int p_nMaxLevel)
{
    // Declare shared memory for reduction
    extern __shared__ float sharedMem[];
    float* MaxReduce = sharedMem;
    float* MinReduce = &sharedMem[XBLOCK * (MAXEIGNUM - 1)];

    int taskPerTh = (p_nGridSize + XBLOCK - 1) / XBLOCK; // Calculate tasks per thread
    int tid = threadIdx.x;

    // Initial assignment in shared memory
    for (int i = 0; i < p_nEigNum - 1 && tid < p_nGridSize; i++) {
        MaxReduce[i * XBLOCK + tid] = p_devMax[tid + i * p_nGridSize];
        MinReduce[i * XBLOCK + tid] = p_devMin[tid + i * p_nGridSize];
    }

    // First reduction: iteratively check all taskPerThreads
    for (int i = 1; i < taskPerTh; i++) {
        int curIndex = tid + i * XBLOCK;
        if (curIndex < p_nGridSize) {
            for (int j = 0; j < p_nEigNum - 1; j++) {
                float curMax = p_devMax[curIndex + j * p_nGridSize];
                float curMin = p_devMin[curIndex + j * p_nGridSize];
                if (MaxReduce[j * XBLOCK + tid] < curMax) {
                    MaxReduce[j * XBLOCK + tid] = curMax;
                }
                if (MinReduce[j * XBLOCK + tid] > curMin) {
                    MinReduce[j * XBLOCK + tid] = curMin;
                }
            }
        }
    }
    __syncthreads();

    // Subsequent reductions: Use bit manipulation for efficient reduction
    for (int d = 64; d > 0; d >>= 1) {
        if (tid < d) {
            int offset = tid + d;
            if (offset < p_nGridSize) {
                for (int i = 0; i < p_nEigNum - 1; i++) {
                    if (MaxReduce[i * XBLOCK + tid] < MaxReduce[i * XBLOCK + offset]) {
                        MaxReduce[i * XBLOCK + tid] = MaxReduce[i * XBLOCK + offset];
                    }
                    if (MinReduce[i * XBLOCK + tid] > MinReduce[i * XBLOCK + offset]) {
                        MinReduce[i * XBLOCK + tid] = MinReduce[i * XBLOCK + offset];
                    }
                }
            }
        }
        __syncthreads();
    }

    // Store results back to global memory by the first thread
    if (tid == 0)
    {
        for (int i = 0; i < p_nEigNum - 1; i++)
        {
            p_devReduceMax[i] = MaxReduce[i * XBLOCK];
            p_devReduceMin[i] = MinReduce[i * XBLOCK];
        }
    }
}