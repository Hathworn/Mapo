#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap2(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    // Cache frequently accessed values
    float myResample = 0.0f;
    int constant = 4294967295 / bins;
    int constant2 = blockIdx.x * bins;
    int dmid = bins * (blockDim.y * blockIdx.y + threadIdx.y);

    // Use shared memory to reduce global memory access
    __shared__ unsigned int s_irand[1024];
    __shared__ float s_idata[1024];
    
    if (threadIdx.x < bins) {
        s_irand[threadIdx.x] = g_irand[constant2 + threadIdx.x];
    }
    
    if (threadIdx.x < bins) {
        s_idata[threadIdx.x] = g_idata[dmid + threadIdx.x];
    }
    
    __syncthreads();

    for (int i = 0; i < bins; i++) {
        int rid = s_irand[i] / constant;
        myResample += s_idata[(rid + threadIdx.x) % bins];
    }

    // Compute output index
    dmid = num_boots * (blockDim.y * blockIdx.y + threadIdx.y);
    g_odata[dmid + threadIdx.x + blockDim.x * blockIdx.x] = ((double)myResample / (double)num_els);
}