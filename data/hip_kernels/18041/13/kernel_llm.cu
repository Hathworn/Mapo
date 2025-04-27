#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( uchar4 *ptr, int ticks ) {
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // calculate fx and fy only once and reuse
    float fx = x - DIM/2;
    float fy = y - DIM/2;
    float d = sqrtf(fx * fx + fy * fy);

    // precompute reused values for clarity and potential efficiency
    float dDiv10 = d / 10.0f;
    float cosineArgument = dDiv10 - ticks / 7.0f;
    float cosineValue = cosf(cosineArgument);

    // compute grey value using precomputed values
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cosineValue / (dDiv10 + 1.0f));

    // set pixel values in one step for potential optimization
    ptr[offset] = make_uchar4(grey, grey, grey, 255);
}