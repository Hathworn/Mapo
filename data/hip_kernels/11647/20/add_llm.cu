#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(double* in, double* out, int offset, int n) {
    int gid = threadIdx.x + blockIdx.x * blockDim.x;

    // Exit early if the thread is out of bounds
    if (gid >= n) return; 

    // Perform the addition in a conditional operation
    double temp = in[gid];
    if (gid >= offset) {
        temp += in[gid-offset];
    }

    // Coalesced memory write
    out[gid] = temp;
}