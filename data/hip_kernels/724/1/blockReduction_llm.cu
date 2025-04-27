#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockReduction(double* dN_pTdpTdphidy_d, int final_spectrum_size, int blocks_ker1)
{
    long idx = threadIdx.x + blockDim.x * blockIdx.x;
    if (idx < final_spectrum_size)
    {
        if (blocks_ker1 == 1) return; // Early exit if only one block

        double sum = dN_pTdpTdphidy_d[idx];
        for (int i = 1; i < blocks_ker1; i++)
        {
            sum += dN_pTdpTdphidy_d[idx + i * final_spectrum_size];
        }
        dN_pTdpTdphidy_d[idx] = sum;

        if (isnan(sum)) printf("found dN_pTdpTdphidy_d nan \n"); // Check NaN after reduction
    }
}