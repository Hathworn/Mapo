#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel( uchar4 *ptr, int ticks ) {
    // map from threadIdx/BlockIdx to pixel position
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // calculate fx and fy only once
    float fx = x - DIM / 2;
    float fy = y - DIM / 2;
    
    // optimize distance calculation by reducing expensive sqrt operation
    float d_sq = fx * fx + fy * fy;
    float d = sqrtf(d_sq);

    // use a register to store intermediate calculation for grey
    float cos_val = cosf(d / 10.0f - ticks / 7.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * cos_val / (d / 10.0f + 1.0f));

    // use vectorized assignment
    ptr[offset] = make_uchar4(grey, grey, grey, 255);
}