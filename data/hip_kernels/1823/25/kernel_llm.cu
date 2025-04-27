#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( uchar4 *ptr, int ticks ) {
    // Use shared memory for intermediate calculations
    __shared__ float fx, fy, d;
    
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Precompute commonly used constants
    float DIM_HALF = DIM / 2.0f; 

    // Calculate position-dependent variables
    fx = x - DIM_HALF;
    fy = y - DIM_HALF;
    d = sqrtf(fx * fx + fy * fy);
    
    // Compute grey value using precomputed variables
    float val = cosf(d / 10.0f - ticks / 7.0f) / (d / 10.0f + 1.0f);
    unsigned char grey = (unsigned char)(128.0f + 127.0f * val);
    
    // Assign values to the uchar4 structure
    ptr[offset].x = grey;
    ptr[offset].y = grey;
    ptr[offset].z = grey;
    ptr[offset].w = 255;
}