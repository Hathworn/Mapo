#include "hip/hip_runtime.h"
#include "includes.h"

// Use a templated kernel to support different vector types and enhance efficiency
template <typename T>
__global__ void scaleVector(T *d_res, const T *d_src, T scale, const int len)
{
    // Calculate global position
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread is within bounds
    if (pos < len)
    {
        // Perform scaling operation
        d_res[pos] = d_src[pos] * scale;
    }
}