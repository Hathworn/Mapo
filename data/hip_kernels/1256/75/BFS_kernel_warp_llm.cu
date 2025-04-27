#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BFS_kernel_warp( unsigned int *levels, unsigned int *edgeArray, unsigned int *edgeArrayAux, int W_SZ, int CHUNK_SZ, unsigned int numVertices, int curr, int *flag)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate warp id
    int warpId = tid / W_SZ;

    // Early return if warpId is out of bounds
    if (warpId >= CHUNK_SZ) return;

    // Loop through vertices in chunks
    for (int i = warpId; i < numVertices; i += CHUNK_SZ)
    {
        // Check if the current level is the same as 'curr'
        if (levels[i] == curr)
        {
            // Loop through the edges for the current vertex
            for (unsigned int j = edgeArray[i]; j < edgeArray[i + 1]; j++)
            {
                unsigned int neighbor = edgeArrayAux[j];
                
                // Update levels with a new level and set flag
                if (levels[neighbor] == UINT_MAX)
                {
                    levels[neighbor] = curr + 1;
                    *flag = 1;
                }
            }
        }
    }
}