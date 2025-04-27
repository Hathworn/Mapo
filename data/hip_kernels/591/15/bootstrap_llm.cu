#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bootstrap(int bins, int num_els, int num_boots, float *g_idata, double *g_odata, unsigned int *g_irand)
{
    float myResample = 0.0f;

    // Use shared memory to optimize memory access
    extern __shared__ float shared_idata[];
    int tid = threadIdx.x + threadIdx.y * blockDim.x;
    
    unsigned int constant = (4294967295 / (bins - blockDim.x));
    int constant2 = blockIdx.x * bins;
    int dmid = bins * (blockDim.y * blockIdx.y + threadIdx.y);

    // Load g_idata into shared memory
    if (tid < bins) {
        shared_idata[tid] = g_idata[tid + dmid];
    }
    __syncthreads();

    for (int i = 0; i < bins; i++) {
        int rid = (g_irand[constant2 + i] / (constant));
        myResample += shared_idata[rid + threadIdx.x];
    }

    dmid = num_boots * (blockDim.y * blockIdx.y + threadIdx.y);
    g_odata[dmid + threadIdx.x + blockDim.x * blockIdx.x] = ((double) myResample / (double) num_els);
}