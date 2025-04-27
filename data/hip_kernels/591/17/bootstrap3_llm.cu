#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap3(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    // Use registers to store frequently accessed data
    float myResample = 0.0f;
    int constant = ( 4294967295 / bins );
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    int dmid_base = bins * ( blockDim.y * blockIdx.y + threadIdx.y );
    
    for (int i = 0; i < bins; i++)
    {
        int rid = g_irand[id * bins + i] / constant;
        // Minimize global memory access by using registers
        myResample += g_idata[dmid_base + rid];
    }

    int output_index = num_boots * ( blockDim.y * blockIdx.y + threadIdx.y ) + threadIdx.x + blockDim.x * blockIdx.x;
    g_odata[output_index] = ( (double) myResample / (double) num_els );
}