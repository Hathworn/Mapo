#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_2(int *d_adjList, int *d_sizeAdj, int *d_lcmMatrix, int *d_LCMSize, int n_vertices)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Launch threads only necessary for processing
    if (i < n_vertices)
    {
        int indexUsed = 0, indexOffset = 0;
        int iStart = 0, iEnd = 0;
        int k = 0;

        if (i > 0)
        {
            k = d_sizeAdj[i - 1];
            indexOffset = d_LCMSize[i - 1];
        }

        iEnd = d_sizeAdj[i];

        // Use memset to initialize matrix if supported
        for (int j = indexOffset; j < iEnd; j++)
        {
            d_lcmMatrix[j] = 0;
        }

        __syncthreads(); // Ensure memory consistency

        for (int j = 0; j < n_vertices; j++) {
            if (i == j)
                continue;
            iStart = k;
            int jStart = 0, jEnd = 0;

            if (j > 0)
                jStart = d_sizeAdj[j - 1];
            jEnd = d_sizeAdj[j];

            int compVec = 0;

            while (iStart < iEnd && jStart < jEnd)
            {
                if (d_adjList[iStart] < d_adjList[jStart])
                    iStart++;
                else if (d_adjList[jStart] < d_adjList[iStart])
                    jStart++;
                else // if arr1[i] == arr2[j]
                {
                    jStart++;
                    iStart++;
                    compVec++;
                }
            }

            if (compVec > 0)
            {
                atomicAdd((int *)&d_lcmMatrix[indexUsed + indexOffset], compVec);
                indexUsed++;
            }
        }

        // Use atomic operations for LCMSize update to avoid synchronization
        atomicExch(&d_LCMSize[i], indexUsed);
    }
}