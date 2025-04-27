#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void maxKernel(float *array, int size, float* max)
{
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + tid;
    int stride = blockDim.x * 2 * gridDim.x;

    // Initialize shared memory
    sdata[tid] = (i < size) ? array[i] : -FLT_MAX;
    if (i + blockDim.x < size) {
        sdata[tid] = fmaxf(sdata[tid], array[i + blockDim.x]);
    }
    __syncthreads();

    // Reduce using shared memory
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] = fmaxf(sdata[tid], sdata[tid + s]);
        }
        __syncthreads();
    }

    // Unrolling warp-level reduction
    if (tid < 32) {
        volatile float *vsmem = sdata;
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 32]);
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 16]);
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 8]);
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 4]);
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 2]);
        vsmem[tid] = fmaxf(vsmem[tid], vsmem[tid + 1]);
    }

    // Write result for this block to the max array
    if (tid == 0) {
        max[blockIdx.x] = sdata[0];
    }
}