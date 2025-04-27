#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NewNodeConnectionKernel(int f, int q, int r, int *activityFlag, int *connection, int *age, float *localError, float alfa, int maxCells, float errorFraction)
{
    // Calculate the global thread ID
    int threadId = blockDim.x * blockIdx.y * gridDim.x  // rows preceding current row in grid
                 + blockDim.x * blockIdx.x              // blocks preceding current block
                 + threadIdx.x;

    // Only process the first thread
    if (threadId == 0)
    {
        // Set activity flag
        activityFlag[r] = 1;

        // Reset and update connections and ages
        int indices[] = {q * maxCells + f, f * maxCells + q, q * maxCells + r, r * maxCells + q, f * maxCells + r, r * maxCells + f};
        for (int i = 0; i < 6; ++i)
        {
            connection[indices[i]] = (i >= 2);  // set connection for (q, r), (r, q), (f, r), (r, f) to 1
            age[indices[i]] = 0;  // reset ages
        }

        // Update local errors
        localError[q] *= (1 - alfa);
        localError[f] *= (1 - alfa);
        localError[r] = errorFraction * (localError[q] + localError[f]);
    }
}