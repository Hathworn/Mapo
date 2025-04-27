#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zeros(double *field, int n) {
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use threadIdx.x < blockDim.x to ensure valid memory access
    if (xid < n) {
        field[xid] = 0;
    }
}