#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale(float knot_max, int nx, int nsamples, float * x, int pitch_x)
{
    int col_idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (col_idx >= nx) return;

    float min = FLT_MAX, max = -FLT_MAX;
    float *col = x + col_idx * pitch_x;

    // Use cache-efficient access pattern and parallel reduction if possible
    for (int i = threadIdx.x; i < nsamples; i += blockDim.x) {
        float val = col[i];
        atomicMin(&min, val);
        atomicMax(&max, val);
    }
    __shared__ float s_min, s_max; // Shared memory for cache locality
    if (threadIdx.x == 0) {
        s_min = min;
        s_max = max;
    }
    __syncthreads();

    float delta = s_max - s_min;
    if (delta > 0.0f) {
        for (int i = threadIdx.x; i < nsamples; i += blockDim.x) {
            col[i] = (knot_max * (col[i] - s_min)) / delta;
        }
    }
}