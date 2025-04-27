#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NN_DownSampling(float *target, const float *source, const int wt, const int ht, const int ws, const int hs)
{
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Move condition inside to reduce register pressure
    if (y < ht && x < wt) {
        int curt = y * wt + x;
        int curs = (y * 2) * ws + (x * 2);
        
        // Unroll loop to reduce overhead
        #pragma unroll
        for (int i = 0; i < 3; ++i) {
            target[curt * 3 + i] = source[curs * 3 + i];
        }
    }
}