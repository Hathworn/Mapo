#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SharedMem2globalMem(float *d_memoryA, int iSize)
{
    /* Amount of shared memory is determined by host call */
    extern __shared__ float s_memoryA[];

    /* Generate global index */
    int iID = blockDim.x * blockIdx.x + threadIdx.x;

    /* Calculate number of elements */
    int iNumElements = iSize / sizeof(float);

    /* Utilize optimized stride access pattern */
    for (int i = iID; i < iNumElements; i += blockDim.x * gridDim.x)
    {
        d_memoryA[i] = s_memoryA[i];
    }
}