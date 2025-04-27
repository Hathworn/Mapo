#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockReduction(double* dN_pTdpTdphidy_d, int final_spectrum_size, int blocks_ker1)
{
    long idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Launch threads only if within bounds
    if (idx < final_spectrum_size)
    {
        // This condition is redundant; optimization by using a simple loop in case of blocks_ker1 > 1
        for (int i = 1; i < blocks_ker1; ++i)
        {
            // Reduced memory access by calculating offset once
            int offset = idx + i * final_spectrum_size;

            // Optimize: Use warp shuffle or atomic addition if applicable for large data
            dN_pTdpTdphidy_d[idx] += dN_pTdpTdphidy_d[offset];

            // Check NaN and report
            if (isnan(dN_pTdpTdphidy_d[idx])) printf("found dN_pTdpTdphidy_d nan \n");
        }
    }
}