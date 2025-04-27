#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalculateDiffSample(float *cur, float *pre, const int wts, const int hts) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_pre[];

    const int yts = blockIdx.y * blockDim.y + threadIdx.y;
    const int xts = blockIdx.x * blockDim.x + threadIdx.x;
    const int curst = wts * yts + xts;

    if (yts < hts && xts < wts) {
        // Load pre data into shared memory
        int sharedIdx = threadIdx.y * blockDim.x + threadIdx.x;
        shared_pre[sharedIdx*3+0] = pre[curst*3+0];
        shared_pre[sharedIdx*3+1] = pre[curst*3+1];
        shared_pre[sharedIdx*3+2] = pre[curst*3+2];
        __syncthreads();

        // Calculate difference using shared memory
        cur[curst*3+0] -= shared_pre[sharedIdx*3+0];
        cur[curst*3+1] -= shared_pre[sharedIdx*3+1];
        cur[curst*3+2] -= shared_pre[sharedIdx*3+2];

        // Reset pre array element values
        pre[curst*3+0] = 0;
        pre[curst*3+1] = 0;
        pre[curst*3+2] = 0;
    }
}