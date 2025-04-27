#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(double* in, double* out, int offset, int n){
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Rearrange to improve readability

    // Check bounds once to avoid accessing out of bounds
    if(gid < n) {
        out[gid] = in[gid]; // Copy input element to output

        // Perform addition only if within valid range
        if(gid >= offset) {
            out[gid] += in[gid - offset];
        }
    }
}