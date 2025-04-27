#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_2_SIZES(int *d_adjList, int *d_sizeAdj, int *d_LCMSize, int n_vertices)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if(i < n_vertices)
    {
        int indexUsed = 0;
        int iStart = i == 0 ? 0 : d_sizeAdj[i-1];
        int iEnd = d_sizeAdj[i];

        // __syncthreads(); // Removed redundant __syncthreads() as data isn't shared across threads

        for(int j = 0; j < n_vertices; j++) 
        {
            if(i == j) continue;
            int jStart = j == 0 ? 0 : d_sizeAdj[j-1];
            int jEnd = d_sizeAdj[j];

            int compVec = 0;

            int iPtr = iStart, jPtr = jStart;
            // Loop through both adjacency lists
            while (iPtr < iEnd && jPtr < jEnd)
            {
                if(d_adjList[iPtr] < d_adjList[jPtr])
                    iPtr++;
                else if (d_adjList[jPtr] < d_adjList[iPtr])
                    jPtr++;
                else
                {
                    jPtr++;
                    iPtr++;
                    compVec++;
                    // Early exit if needed
                }
            }

            if (compVec > 0)
            {
                indexUsed++;
            }
        }

        // __syncthreads(); // Removed as it's not needed here

        d_LCMSize[i] = indexUsed;
    }
}
```
