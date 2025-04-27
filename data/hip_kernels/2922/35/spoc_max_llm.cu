#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void spoc_max(const double* input, double* output, const int size)
{
    // Use shared memory for intermediate results
    extern __shared__ double sdata[];

    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + tid;
    
    // Initialize shared memory
    sdata[tid] = (i < size) ? fabs(input[i]) : 0.0;
    __syncthreads();

    // Reduce within block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] = fmax(sdata[tid], sdata[tid + s]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) output[blockIdx.x] = sdata[0];
}