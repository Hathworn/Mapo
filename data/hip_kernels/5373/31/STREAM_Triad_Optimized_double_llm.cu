#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_Optimized_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Compute unique global thread index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use stride loop for better occupancy and coalesced memory accesses
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + scalar * b[i];
    }
}