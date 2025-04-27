```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CreateAndRefreshConnectionKernel(int s1, int s2, int *connection, int *age, int maxCells)
{
    // Compute the unique threadId for the thread in the 1D grid
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Only the first thread needs to perform the operation
    if (threadId == 0)
    {
        // Update the connection and age matrices
        int index1 = s1 * maxCells + s2;
        int index2 = s2 * maxCells + s1;
        connection[index1] = 1;
        age[index1] = 0;
        connection[index2] = 1;
        age[index2] = 0;
    }
}