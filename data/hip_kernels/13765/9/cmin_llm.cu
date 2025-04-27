#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cmin(float *d_in, float *min, int len)
{
    extern __shared__ float smin[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Combined initial value assignment with boundary check
    smin[tid] = (i < len) ? d_in[i] : FLT_MAX; 

    __syncthreads();

    // Loop unrolling and warp synchronisation optimization
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            smin[tid] = min(smin[tid], smin[tid + s]);
        }
        __syncthreads();
    }

    if (tid == 0) {
        min[blockIdx.x] = smin[0];
    }
}