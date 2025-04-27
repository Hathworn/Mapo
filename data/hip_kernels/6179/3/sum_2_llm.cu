#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_2(float4 *localbuf, float4 *ptrd, int offset_0, int offset_1, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for coalesced access
    extern __shared__ float4 shared[];
    
    if (idx < N) {
        shared[threadIdx.x] = ptrd[offset_0 + idx];
        float4 t2 = ptrd[offset_1 + idx];

        shared[threadIdx.x].x += t2.x;
        shared[threadIdx.x].y += t2.y;
        shared[threadIdx.x].z += t2.z;
        shared[threadIdx.x].w += t2.w;

        // Write back to global memory
        localbuf[idx] = shared[threadIdx.x];
    }
}