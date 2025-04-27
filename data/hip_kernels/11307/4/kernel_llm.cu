#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( uchar4 *ptr, int ticks ) {
    // Precompute constants outside the loop
    int half_dim = DIM / 2;
    float ticks_factor = ticks / 7.0f;

    // Map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Calculate the value at that position
    float fx = x - half_dim;
    float fy = y - half_dim;
    float d = sqrtf(fx * fx + fy * fy);
    float denom = d / 10.0f + 1.0f;
    // Perform the cosine operation
    float cos_val = cosf(d / 10.0f - ticks_factor);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * (cos_val / denom));
    
    // Store computed grey level in uchar4
    ptr[offset].x = grey;
    ptr[offset].y = grey;
    ptr[offset].z = grey;
    ptr[offset].w = 255;
}