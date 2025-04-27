#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    float myResample = 0.0f;

    // Precompute constants outside the loop
    unsigned int constant = (4294967295 / (bins - blockDim.x));
    int constant2 = blockIdx.x * bins;
    int dmid = bins * (blockDim.y * blockIdx.y + threadIdx.y);
    int thread_offset = dmid + threadIdx.x;

    // Efficiently iterate over bins and accumulate result
    for (int i = 0; i < bins; i++)
    {
        int rid = (g_irand[constant2 + i] / constant);
        myResample += g_idata[rid + thread_offset];
    }

    dmid = num_boots * (blockDim.y * blockIdx.y + threadIdx.y);
    g_odata[dmid + threadIdx.x + blockDim.x * blockIdx.x] = ((double)myResample / (double)num_els);
}