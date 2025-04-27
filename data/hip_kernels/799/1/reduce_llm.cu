#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int *s) {
    int lane = threadIdx.x % 32;

    s[threadIdx.x] = p;
    __syncthreads();
    
    if (lane < 16) { s[threadIdx.x] += s[threadIdx.x + 16]; } __syncthreads();
    if (lane < 8)  { s[threadIdx.x] += s[threadIdx.x + 8]; }  __syncthreads();
    if (lane < 4)  { s[threadIdx.x] += s[threadIdx.x + 4]; }  __syncthreads();
    if (lane < 2)  { s[threadIdx.x] += s[threadIdx.x + 2]; }  __syncthreads();
    if (lane < 1)  { s[threadIdx.x] += s[threadIdx.x + 1]; }  __syncthreads();

    return s[threadIdx.x - lane]; // return result from lane 0 of each warp
}

__global__ void reduce(unsigned int *d_out_shared, const unsigned int *d_in)
{
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;

    // Perform warp-level reduction
    unsigned int sr = shared_reduce(d_in[t], s);

    // Aggregate results from all warps
    if (t % 32 == 0) {
        atomicAdd(d_out_shared, sr);
    }
}