#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void build_hll(int n, unsigned int *in, unsigned int *out) {
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (offset >= n) return;

    // Extract the parts
    unsigned int val = in[offset];
    int bucket = val >> HLL_BUCKET_WIDTH;
    int pos = val & ((1 << HLL_BUCKET_WIDTH) - 1);

    // Atomically update the maximum position
    atomicMax(&out[bucket], pos);
}