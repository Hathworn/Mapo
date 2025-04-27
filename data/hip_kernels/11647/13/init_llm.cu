#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(double* out, int n){
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if gid is in valid range before writing
    if (gid < n) {
        out[gid] = 0.0;
    }
}