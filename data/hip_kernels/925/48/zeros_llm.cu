#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zeros(double *field, int n) {
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    // Use coalesced memory access by ensuring contiguous threads 
    // access contiguous memory locations
    for (int i = xid; i < n; i += blockDim.x * gridDim.x) {
        field[i] = 0;
    }
}