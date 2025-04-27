#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_4_SIZES(int *d_adjList, int *d_sizeAdj, int *d_LCMSize, int n_vertices)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if(i < n_vertices)
    {
        int indexUsed = 0;
        int iStart = 0;
        int iEnd = d_sizeAdj[i];

        if(i > 0) 
        {
            iStart = d_sizeAdj[i-1];
        }

        // Remove unnecessary __syncthreads()

        for(int j = 0; j < n_vertices; j++) 
        {
            if(i == j) 
                continue;

            int jStart = 0;
            int jEnd = d_sizeAdj[j];

            if(j > 0)
                jStart = d_sizeAdj[j-1];

            int compVec = 0; 

            // Optimize the while loop for better memory access patterns
            for (; iStart < iEnd && jStart < jEnd; )
            {
                int val1 = d_adjList[iStart];
                int val2 = d_adjList[jStart];
                
                if(val1 < val2)
                    iStart++;
                else if (val2 < val1)
                    jStart++;
                else
                {
                    compVec = 1;
                    break;
                }
            }

            if (compVec > 0)
            {
                indexUsed++;
            }
        }

        // Remove unnecessary __syncthreads()
        
        d_LCMSize[i] = indexUsed;
    }
}