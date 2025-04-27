#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int* in, int d, int n) {
    // Calculate global thread ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if gid is within bounds
    if (gid < n) {
        // Calculate the offset based on d
        int pre = (d == 0) ? 1 : (1 << d);
        
        // Update array element conditionally
        if (gid >= pre) {
            in[gid] += in[gid - pre];
        }
    }
}