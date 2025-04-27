#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFillEmptySlots(short *cnewtri, int *cprefix, int *cempty, int *ctriangles, int nTris, int newnTris, int offset)
{
    int x = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    if (x >= nTris || cnewtri[x] < 0)
        return;

    __shared__ int sharedMemory[256]; // Utilize shared memory for temporary storage

    int value;

    if (x < newnTris)
        value = x;
    else {
        value = cempty[cprefix[x] - offset];

        int idx = threadIdx.x;
        for (int i = idx; i < 9; i += blockDim.x)
            sharedMemory[i] = ctriangles[x * 9 + i];  // Use shared memory for loading data

        __syncthreads();  // Synchronize threads to ensure all data is loaded

        for (int i = idx; i < 9; i += blockDim.x)
            ctriangles[value * 9 + i] = sharedMemory[i];  // Write data from shared memory to global memory
    }

    cprefix[x] = value;
}