#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smem_dynamic_test(int *in, int *out, int size) 
{
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ int smem[];

    // Check gid is within valid range to avoid redundant check
    if (gid >= size) return; 

    // Utilize shared memory; coalesced access
    smem[tid] = in[gid];
    __syncthreads(); // Ensure all threads have written to shared memory before reading

    out[gid] = smem[tid];
}