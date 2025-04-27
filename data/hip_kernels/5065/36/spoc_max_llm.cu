#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/

/****** Double precision *****/

#ifdef __cplusplus
}
#endif

__global__ void spoc_max(const double* input, double* output, const int size)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ double sdata[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Load data into shared memory
    if (i < size) {
        sdata[tid] = fabs(input[i]);
    } else {
        sdata[tid] = 0.0;  // Set to 0 if out of bounds
    }
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] = fmax(sdata[tid], sdata[tid + s]);
        }
        __syncthreads();
    }

    // First thread writes the result to the output
    if (tid == 0) {
        atomicMax((unsigned long long int*)output, __double_as_longlong(sdata[0]));
    }
}