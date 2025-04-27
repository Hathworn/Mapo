#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindMaxMinPerGrid(int p_nGridSize, int p_nEigNum, float* p_devMax, float* p_devMin, float* p_devReduceMax, float* p_devReduceMin, int p_nMaxLevel)
{
    __shared__ float MaxReduce[XBLOCK*(MAXEIGNUM - 1)];
    __shared__ float MinReduce[XBLOCK*(MAXEIGNUM - 1)];

    int taskPerTh = (p_nGridSize + XBLOCK - 1) / XBLOCK;
    int idx = threadIdx.x;
    
    // First Assignment
    if (idx < p_nGridSize)
    {
        for (int i = 0; i < p_nEigNum - 1; i++)
        {
            MaxReduce[i*XBLOCK + idx] = p_devMax[idx + i * p_nGridSize];
            MinReduce[i*XBLOCK + idx] = p_devMin[idx + i * p_nGridSize];
        }
    }
    __syncthreads();

    // First Reduction
    for (int i = 1; i < taskPerTh; i++)
    {
        int curIndex = idx + i * XBLOCK;
        if (curIndex < p_nGridSize)
        {
            for (int j = 0; j < p_nEigNum - 1; j++)
            {
                float* maxAddr = &MaxReduce[j*XBLOCK + idx];
                float* minAddr = &MinReduce[j*XBLOCK + idx];
                atomicMax(maxAddr, p_devMax[curIndex + j * p_nGridSize]); // Use atomic operation for max
                atomicMin(minAddr, p_devMin[curIndex + j * p_nGridSize]); // Use atomic operation for min
            }
        }
    }
    __syncthreads();

    // Further Reductions
    int mask = 1;
    for (int level = 0; level < p_nMaxLevel; level++)
    {
        int index1 = idx;
        int index2 = (1 << level) + idx;
        if ((idx & mask) == 0 && index2 < p_nGridSize)
        {
            for (int i = 0; i < p_nEigNum - 1; i++)
            {
                float &maxRef = MaxReduce[i*XBLOCK + index1];
                float &minRef = MinReduce[i*XBLOCK + index1];
                atomicMax(&maxRef, MaxReduce[i*XBLOCK + index2]); // Use atomic operation for further reductions
                atomicMin(&minRef, MinReduce[i*XBLOCK + index2]); // Use atomic operation for further reductions
            }
        }
        __syncthreads();
        mask = (mask << 1) | 1;
    }

    // Write max and min into global memory
    if (idx == 0)
    {
        for (int i = 0; i < p_nEigNum - 1; i++)
        {
            p_devReduceMax[i] = MaxReduce[i*XBLOCK];
            p_devReduceMin[i] = MinReduce[i*XBLOCK];
        }
    }
}