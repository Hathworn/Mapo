#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bankConflictsRead(float *outFloat, int iStride, unsigned long long *ullTime)
{
    /* Static size of shared memory */
    __shared__ float s_memoryA[2048]; // Use power of 2 size for better alignment

    /* Variable in register */
    float r_var;

    /* Start measure clock cycles */
    unsigned long long startTime = clock64();

    /* Optimize memory access pattern */
    int index = threadIdx.x * iStride;
    if (index < 2048) {
        /* Access data from shared memory to register */
        r_var = s_memoryA[index];
    }

    /* End measure clock cycles */
    unsigned long long endTime = clock64();
    ullTime[threadIdx.x] = endTime - startTime; // Use per-thread timing

    /* Conditionally assign register var to avoid optimization */
    if (threadIdx.x == 0) outFloat[0] = r_var;
}