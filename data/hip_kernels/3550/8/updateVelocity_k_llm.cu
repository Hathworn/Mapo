#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    float scale = 1.f / (dx * dy); // Pre-compute scale factor outside the loop for efficiency

    // gtidx is the domain location in x for this thread
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            // fi is the domain location in y for this thread
            int fi = gtidy + p;
            if (fi < dy) {
                int fjr = fi * pdx + gtidx;
                float2 nvterm; // Move variable declaration here to limit scope
                nvterm.x = vx[fjr] * scale;
                nvterm.y = vy[fjr] * scale;

                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}