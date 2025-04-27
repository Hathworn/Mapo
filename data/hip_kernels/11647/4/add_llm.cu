#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* in, int* out, int offset, int n) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global ID
    if (gid < n) { // Check bounds
        int value = in[gid]; // Load value from input
        if (gid >= offset) {
            value += in[gid - offset]; // Add offset value if valid
        }
        out[gid] = value; // Write result to output
    }
}