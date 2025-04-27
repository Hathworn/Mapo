#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize BFS kernel function
__global__ void BFSLevels(int *vertices, int *edges, int *distances, int *predecessors, int *vertIndices, int *edgeSize, bool *levels, bool *visitedVertices, bool *foundDest, int numVert, int destination) 
{
    int thrID = threadIdx.x + blockIdx.x * blockDim.x;

    extern __shared__ bool sharedDestFound[];
    bool localDestFound = false;

    if (thrID < numVert && !*foundDest) 
    {
        int curVert = vertices[thrID];

        if (levels[curVert]) 
        {
            levels[curVert] = false;
            visitedVertices[curVert] = true;

            int edgesEnd = edgeSize[thrID] + vertIndices[thrID];

            for (int edgeIter = vertIndices[thrID]; edgeIter < edgesEnd; ++edgeIter) 
            {
                int nextVert = edges[edgeIter];

                if (!visitedVertices[nextVert]) 
                {
                    distances[nextVert] = distances[curVert] + 1;
                    levels[nextVert] = true;
                    predecessors[nextVert] = curVert;

                    if (nextVert == destination) 
                    {
                        *foundDest = true;
                        localDestFound = true;
                        break; // Exit the loop as destination found
                    }
                }
            }
        }
        
        // Update shared memory only from a single thread (block-level synchronization)
        if (localDestFound) {
            sharedDestFound[0] = true;
        }
    }

    // Sync and update the global flag from shared
    __syncthreads();
    if (sharedDestFound[0]) {
        *foundDest = true;
    }
}