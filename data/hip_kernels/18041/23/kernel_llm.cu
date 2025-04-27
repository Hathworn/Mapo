#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( unsigned char *ptr, int ticks ) {
    // Optimized calculation of pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Precompute constants for efficiency
    float dim_half = DIM/2;
    float fx = x - dim_half;
    float fy = y - dim_half;
    float d = sqrtf(fx * fx + fy * fy);

    // Use fast intrinsic functions and simplified expressions
    float cos_term = cosf(d * 0.1f - ticks * 0.142857f);
    float denominator = d * 0.1f + 1.0f;
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cos_term / denominator);

    // Efficient memory writes using shared memory or registers
    ptr[offset * 4 + 0] = grey;
    ptr[offset * 4 + 1] = grey;
    ptr[offset * 4 + 2] = grey;
    ptr[offset * 4 + 3] = 255;
}