#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float *d_out, const float *d_in) {
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Ensure myId is within bounds before loading
    sdata[tid] = (myId < gridDim.x * blockDim.x) ? d_in[myId] : 0.0f;
    __syncthreads();

    // Use unrolling for the last warp if needed
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Unrolling warp loop for efficiency
    if (tid < 32) {
        volatile float *vsmem = sdata; // Volatile to prevent reordering
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) {
        d_out[blockIdx.x] = sdata[0];
    }
}