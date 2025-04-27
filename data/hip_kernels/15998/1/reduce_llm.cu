#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int shared_reduce(unsigned int p, volatile unsigned int *s) {
    int lane = threadIdx.x % warpSize;  // Get lane index in the warp
    int warpId = threadIdx.x / warpSize; // Get warp index

    s[threadIdx.x] = p;

    // Perform warp-level reduction using shuffle operations
    if (lane < 16) s[threadIdx.x] += s[threadIdx.x + 16];
    if (lane < 8) s[threadIdx.x] += s[threadIdx.x + 8];
    if (lane < 4) s[threadIdx.x] += s[threadIdx.x + 4];
    if (lane < 2) s[threadIdx.x] += s[threadIdx.x + 2];
    if (lane < 1) s[threadIdx.x] += s[threadIdx.x + 1];

    // Write warp result to shared memory
    if (lane == 0) {
        s[warpId] = s[threadIdx.x];
    }

    __syncthreads(); // Synchronize to ensure all warp reductions are complete

    // Reduce across warps
    if (warpId == 0) {
        if (lane < 16) s[lane] += s[lane + 16];
        if (lane < 8) s[lane] += s[lane + 8];
        if (lane < 4) s[lane] += s[lane + 4];
        if (lane < 2) s[lane] += s[lane + 2];
        if (lane < 1) s[lane] += s[lane + 1];
    }

    return s[0]; // Return the result from the first element
}

__global__ void reduce(unsigned int *d_out_shared, const unsigned int *d_in) {
    extern __shared__ unsigned int s[];
    int t = threadIdx.x;
    int p = d_in[t];
    unsigned int sr = shared_reduce(p, s);
    if (t == 0) {
        *d_out_shared = sr;
    }
}