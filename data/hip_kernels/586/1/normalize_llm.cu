#include "hip/hip_runtime.h"
#include "includes.h"

/*******************************************************copy the components to the wave**************************************************************/
/****************************************************normalize operation*************************************************************/
/****************************************************compute_masks operation*************************************************************/
__global__ void normalize(float *nor_ary, float *flit_ary, float tw, float ts, size_t N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory access if N is large
    __shared__ float temp_ary[256]; // Example: assuming blockDim.x <= 256

    if (tid < N) {
        // Load data into shared memory
        temp_ary[threadIdx.x] = flit_ary[tid];
        __syncthreads();

        // Compute normalization using shared memory
        float value = temp_ary[threadIdx.x];
        if (value >= ts) nor_ary[tid] = 1.0f;
        else if (value < tw) nor_ary[tid] = 0.0f;
        else nor_ary[tid] = (value - tw) / (ts - tw);
    }
}