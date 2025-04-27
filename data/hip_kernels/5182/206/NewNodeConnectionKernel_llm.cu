#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NewNodeConnectionKernel(int f, int q, int r, int *activityFlag, int *connection, int *age, float *localError, float alfa, int maxCells, float errorFraction)
{
    // Calculate thread ID across grid
    int threadId = blockDim.x * blockIdx.x + threadIdx.x;

    // Process only the first thread
    if (threadId == 0)
    {
        // Update activity flag for node r
        activityFlag[r] = 1;

        // Reset connections and ages for nodes f and q
        connection[q * maxCells + f] = 0;
        age[q * maxCells + f] = 0;
        connection[f * maxCells + q] = 0;
        age[f * maxCells + q] = 0;

        // Set connections and ages for nodes q and r, f and r
        connection[q * maxCells + r] = 1;
        age[q * maxCells + r] = 0;
        connection[r * maxCells + q] = 1;
        age[r * maxCells + q] = 0;
        connection[f * maxCells + r] = 1;
        age[f * maxCells + r] = 0;
        connection[r * maxCells + f] = 1;
        age[r * maxCells + f] = 0;

        // Update local error values for nodes q, f, and r
        localError[q] -= alfa * localError[q];
        localError[f] -= alfa * localError[f];
        localError[r] = errorFraction * (localError[q] + localError[f]);
    }
}