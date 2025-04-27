#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale(float knot_max, int nx, int nsamples, float * x, int pitch_x)
{
    int col_idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure thread does not process columns beyond nx
    if (col_idx >= nx) return;
    
    float min, max, * col = x + col_idx * pitch_x;

    // Optimizing min/max search using a single loop
    min = max = col[0];
    #pragma unroll  // Improve loop execution by unrolling
    for (int i = 1; i < nsamples; i++) {
        float val = col[i];
        if (val < min) min = val;
        if (val > max) max = val;
    }
    
    float delta = max - min;
    
    // Efficient scaling operation
    #pragma unroll  // Better loop throughput via unrolling
    for (int i = 0; i < nsamples; i++) {
        col[i] = (knot_max * (col[i] - min)) / delta;
    }
}