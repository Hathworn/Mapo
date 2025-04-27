#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddAndRefreshConnectionKernel(int node1, int node2, int *activityFlag, int *connection, int *age, int maxCells)
{
    const int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadId == 0) // Use only the first thread to perform the operation
    {
        // Mark nodes as active
        activityFlag[node1] = 1;
        activityFlag[node2] = 1;

        // Establish and refresh connection, set age to 0
        const int idx1 = node1 * maxCells + node2;
        const int idx2 = node2 * maxCells + node1;
        connection[idx1] = 1;
        age[idx1] = 0;
        connection[idx2] = 1;
        age[idx2] = 0;
    }
}