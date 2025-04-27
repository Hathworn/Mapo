#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CreateAndRefreshConnectionKernel(int s1, int s2, int *connection, int *age, int maxCells)
{
    // Calculate unique thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Single-thread optimization to avoid unnecessary calculations
    if (threadId == 0) {
        int index1 = s1 * maxCells + s2;
        int index2 = s2 * maxCells + s1;
        
        connection[index1] = 1;
        age[index1] = 0;
        connection[index2] = 1;
        age[index2] = 0;
    }
}