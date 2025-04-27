#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Shrink_DownSampling(float *target, const float *source, const int wt, const int ht, const int ws, const int hs)
{
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    if(y < ht && x < wt) {
        const int curt = (y * wt + x) * 3; // Optimize memory access pattern
        const int curs = (y * 2 * ws + x * 2) * 3;
        
        float sumR = 0.0f, sumG = 0.0f, sumB = 0.0f;
        
        // Unroll loops and use common subexpression elimination for source indexing
        for(int dy = 0; dy < 2; ++dy) {
            for(int dx = 0; dx < 2; ++dx) {
                int idx = curs + (dy * ws + dx) * 3;
                sumR += source[idx + 0];
                sumG += source[idx + 1];
                sumB += source[idx + 2];
            }
        }
        
        target[curt + 0] = sumR * 0.25f;
        target[curt + 1] = sumG * 0.25f;
        target[curt + 2] = sumB * 0.25f;
    }
}