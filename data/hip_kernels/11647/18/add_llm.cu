#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int* in, int* out, int offset, int n){
    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    // Check if index is within bounds
    if (gid < n) {
        out[gid] = in[gid];
        // Perform addition only if gid is greater than or equal to offset
        if (gid >= offset) {
            out[gid] += in[gid-offset];
        }
    }
}