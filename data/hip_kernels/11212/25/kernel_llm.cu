#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel( unsigned char *ptr, int ticks ) {
    // Use shared memory for intermediate calculations
    __shared__ float sh_fx;
    __shared__ float sh_fy;
    __shared__ float sh_d;
    
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Calculate pixel position relative to center
    fx = x - DIM/2;
    fy = y - DIM/2;

    // Preload shared memory with calculated values
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sh_fx = fx;
        sh_fy = fy;
        sh_d = sqrtf( sh_fx * sh_fx + sh_fy * sh_fy );
    }
    __syncthreads();
    
    // Calculate grey level using shared memory value
    unsigned char grey = (unsigned char)(128.0f + 127.0f *
                  cos(sh_d/10.0f - ticks/7.0f) /
                  (sh_d/10.0f + 1.0f));
    ptr[offset*4 + 0] = grey;
    ptr[offset*4 + 1] = grey;
    ptr[offset*4 + 2] = grey;
    ptr[offset*4 + 3] = 255;
}