#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(double* __restrict__ in, double* __restrict__ out, int offset, int n) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds only once
    if (gid >= n) return;

    out[gid] = in[gid];

    if (gid >= offset) {
        out[gid] += in[gid - offset];
    }
}