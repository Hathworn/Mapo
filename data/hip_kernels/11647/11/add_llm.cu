#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(double* in, double* out, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit to prevent unnecessary computation
    if (gid < n) {
        out[gid] = in[gid];
        // Perform addition only when necessary
        if (gid >= offset) {
            out[gid] += in[gid - offset];
        }
    }
}