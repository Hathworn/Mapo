#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap2(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    // Initialize resample variable
    float myResample = 0.0f;

    // Precompute some values outside the loop
    int constant = (4294967295 / bins);
    int constant2 = blockIdx.x * bins;
    int dmid = bins * (blockDim.y * blockIdx.y + threadIdx.y);
    int threadOffset = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Loop through bins
    for (int i = 0; i < bins; i++)
    {
        // Calculate random index efficiently
        int rid = g_irand[constant2 + i] / constant;

        // Accumulate resampling data
        myResample += g_idata[dmid + ((rid + threadIdx.x) % bins)];
    }

    // Store the result in global memory
    dmid = num_boots * (blockDim.y * blockIdx.y + threadIdx.y);
    g_odata[dmid + threadOffset] = ((double)myResample / (double)num_els);
}