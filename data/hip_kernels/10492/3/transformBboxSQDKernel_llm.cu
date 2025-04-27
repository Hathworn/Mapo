#include "hip/hip_runtime.h"
#include "includes.h"

static __device__ float E = 2.718281828;

__global__ void transformBboxSQDKernel(float *delta, float *anchor, float *res, int block_size)
{
    int threadId = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int di = threadId * 4; // Calculate index for 4-element accesses

    if (di < block_size * 4) { // Ensure index is within bounds
        float d[4] = {delta[di], delta[di+1], delta[di+2], delta[di+3]};
        float a[4] = {anchor[di], anchor[di+1], anchor[di+2], anchor[di+3]};
        
        // Unroll calculations for better optimization
        float cx = a[0] + d[0] * a[2];
        float cy = a[1] + d[1] * a[3];
        float w = a[2] * (d[2] < 1.0f ? __expf(d[2]) : d[2] * E);
        float h = a[3] * (d[3] < 1.0f ? __expf(d[3]) : d[3] * E);
        
        // Store results in global memory
        res[di] = cx - w * 0.5f;
        res[di+1] = cy - h * 0.5f;
        res[di+2] = cx + w * 0.5f;
        res[di+3] = cy + h * 0.5f;
    }
}