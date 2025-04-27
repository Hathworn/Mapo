#include "hip/hip_runtime.h"
#include "includes.h"
#define L2HYS_EPSILON       0.01f
#define L2HYS_EPSILONHYS    1.0f
#define L2HYS_CLIP          0.2f
#define data_h2y            30

__global__ void normalizeL2Hys(float *in,float *out)
{
    // Use shared memory for partial sum and reduce access latency
    __shared__ float partialSum[30];

    int bid = blockIdx.x;
    int tid = threadIdx.x;
    
    // Load input data into register to reduce global memory access
    float val = in[bid * 30 + tid];

    // Perform sum of squares in parallel
    partialSum[tid] = val * val;
    __syncthreads();

    // Use first thread to sum all partial results
    if (tid == 0) {
        float sum = 0;
        for (int i = 0; i < 30; ++i) {
            sum += partialSum[i];
        }
        partialSum[0] = rsqrt(sum) + L2HYS_EPSILONHYS * 30;
    }
    __syncthreads();
    
    // Apply normalization
    out[bid * 30 + tid] = val * (1.0f / partialSum[0]);
}