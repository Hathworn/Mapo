#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Scale_Optimized_double(double *a, double *b, double scale, size_t len)
{
    // Calculate global index for each thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Iterate over all elements by striding with total number of threads
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        b[i] = scale * a[i];
    }
}