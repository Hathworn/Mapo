#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* in, int* out, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    // Use conditional operator for concise increment logic
    if (gid < n) {
        out[gid] = in[gid] + ((gid >= offset) ? in[gid - offset] : 0);
    }
}