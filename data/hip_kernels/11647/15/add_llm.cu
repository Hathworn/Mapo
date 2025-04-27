#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(long* in, long* out, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid < n) { // Check gid once to improve efficiency
        long temp = in[gid];
        if (gid >= offset) 
            temp += in[gid - offset];
        out[gid] = temp;
    }
}