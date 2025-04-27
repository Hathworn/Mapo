#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_sigmoid(float * d, int num) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process elements if thread ID is within bounds
    if (tid < num) {
        float val = d[tid];
        
        // Use ternary operators for concise conditional checks
        d[tid] = (val > 10.0) ? 1.0 : ((val < -10.0) ? 0.0 : 1.0 / (1.0 + expf(-val)));
    }
}