#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Scale_Optimized_double(double *a, double *b, double scale, size_t len)
{
    // Calculate global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use grid-stride loop to utilize more threads
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = scale * a[idx];
    }
}