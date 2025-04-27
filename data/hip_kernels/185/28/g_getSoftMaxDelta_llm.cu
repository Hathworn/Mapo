#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void g_getSoftMaxDelta(float* softMaxDelta, float* softMaxP, float* groudTruth, int len)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if(id < len)
    {
        softMaxDelta[id] = softMaxP[id] - groudTruth[id]; // Compute delta only for valid index
    }
}