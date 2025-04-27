#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddAndRefreshConnectionKernel(int node1, int node2, int *activityFlag, int *connection, int *age, int maxCells)
{
    // Use single thread launch (threadId == 0) for the entire operation
    if (threadIdx.x == 0 && blockIdx.x == 0 && blockIdx.y == 0)
    {
        activityFlag[node1] = 1;
        activityFlag[node2] = 1;

        connection[node1 * maxCells + node2] = 1;
        age[node1 * maxCells + node2] = 0;
        connection[node2 * maxCells + node1] = 1;
        age[node2 * maxCells + node1] = 0;
    }
}