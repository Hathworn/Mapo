#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(long* in, long* out, int offset, int n) {
    // Calculate the global thread ID:
    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    // Early exit for threads with ID >= n, improving efficiency:
    if (gid >= n) return;
    // Perform the addition operations with bounds check:
    long temp = in[gid];
    if (gid >= offset) {
        temp += in[gid - offset];
    }
    out[gid] = temp;
}