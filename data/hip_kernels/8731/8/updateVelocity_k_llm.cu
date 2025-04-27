#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Pre-calculating scale factor to avoid repetitive division
    float scale = 1.f / (dx * dy);

    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                // Reduced number of array index calculations
                int fjr = fi * pdx + gtidx;
                
                float vxterm = vx[fjr];
                float vyterm = vy[fjr];

                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Simplified pointer arithmetic for memory access
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}