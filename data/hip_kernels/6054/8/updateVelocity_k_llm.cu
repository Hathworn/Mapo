#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int baseY = blockIdx.y * (lb * blockDim.y);
    float scale = 1.f / (dx * dy); // Precompute scale factor
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = baseY + threadIdx.y * lb + p;
            if (fi < dy) {
                int fjr = fi * pdx + gtidx;
                float vxterm = vx[fjr]; // Directly use inline variables
                float vyterm = vy[fjr];
                
                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Simplify memory access for float2* fj
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}