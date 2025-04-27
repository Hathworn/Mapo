#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void special(float *d_out, const float * __restrict__ d_in, int size) {
    const unsigned int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < size) {
        float x = d_in[gid];
        // Optimize division and powf calculation
        float divisor = x - 2.3f;
        float result = (divisor != 0.0f) ? x / divisor : 0.0f;
        d_out[gid] = result * result * result;
    }
}