#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* in, int* out, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;

    // Use branch-less assignment with conditional operator
    out[gid] = (gid < n) ? in[gid] + ((gid >= offset) ? in[gid - offset] : 0) : 0;
}