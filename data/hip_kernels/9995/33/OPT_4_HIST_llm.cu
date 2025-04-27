#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OPT_4_HIST(int *d_lcmMatrix, int *d_LCMSize, int *d_histogram, int n_vertices)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n_vertices)
    {
        int iStart = (i > 0) ? d_LCMSize[i - 1] : 0; // Use ternary operator for efficiency
        int iSize = d_LCMSize[i] - iStart;
        int count = 0;
        
        // Loop unrolling can be manually applied here if iSize is known to be small and bounded
        for (int j = 0; j < n_vertices; j++) 
        {
            int jStart = (j > 0) ? d_LCMSize[j - 1] : 0; // Use ternary operator for efficiency
            int jSize = d_LCMSize[j] - jStart;
            if (iSize != jSize)
                continue;

            // Optimize: Replace loop with memory comparison if possible
            bool eq = true;
            for (int k = 0; k < iSize; k++)
            {
                if (d_lcmMatrix[iStart + k] != d_lcmMatrix[jStart + k])
                {
                    eq = false;
                    break;
                }
            }
            
            if (eq) 
            {
                count++;
            }
        }

        // Use atomicAdd for thread-safe histogram updates
        atomicAdd(&d_histogram[count], 1);
    }
}