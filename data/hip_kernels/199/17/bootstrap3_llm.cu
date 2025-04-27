#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap3(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    // Use registers for frequently used variables to reduce global memory access time
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    int dmid_base = bins * (blockDim.y * blockIdx.y + threadIdx.y);
    int dmid_output = num_boots * (blockDim.y * blockIdx.y + threadIdx.y);

    // Initialize myResample to 0.0 to prevent using garbage value
    float myResample = 0.0f;
    int constant = (4294967295 / bins);

    // Loop unrolling if it's known that 'bins' won't change frequently
    for (int i = 0; i < bins; i++)
    {
        int rid = g_irand[id * bins + i] / constant;  // Improved access pattern
        myResample += g_idata[dmid_base + rid];
    }

    // Write final result to global memory with computed index
    g_odata[dmid_output + id] = ((double)myResample / (double)num_els);
}