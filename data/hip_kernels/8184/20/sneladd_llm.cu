#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sneladd(float *inA, float *inB, int *sub, int Nprj, int snno)
{
    int idz = threadIdx.x + blockDim.x * blockIdx.x;
    int projIdx = blockIdx.y; // Cache blockIdx.y to avoid repeated access
    
    if (projIdx < Nprj && idz < snno) {
        int indexA = snno * projIdx + idz; // Calculate index for inA
        int indexB = snno * sub[projIdx] + idz; // Calculate index for inB
        inA[indexA] += inB[indexB];
    }
}