#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidyBase = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    float scale = 1.f / (dx * dy);

    // Only proceed if thread is within domain bounds in X
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int gtidy = gtidyBase + p;

            // Only proceed if thread is within domain bounds in Y
            if (gtidy < dy) {
                int fjr = gtidy * pdx + gtidx;
                
                // Load velocity components and scale
                float2 nvterm;
                nvterm.x = vx[fjr] * scale;
                nvterm.y = vy[fjr] * scale;

                // Update velocity vector
                float2 *fj = (float2*)((char*)v + gtidy * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}