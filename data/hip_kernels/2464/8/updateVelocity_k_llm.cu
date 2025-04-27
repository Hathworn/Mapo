#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidyStart = blockIdx.y * (lb * blockDim.y);
    float scale = 1.f / (dx * dy); // Precompute scale factor

    // Check if thread is within the domain in X
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidyStart + threadIdx.y * lb + p; // Calculate global index in y

            // Check if thread is within the domain in Y
            if (fi < dy) {
                int fjr = fi * pdx + gtidx;
                
                // Load vx and vy terms
                float vxterm = vx[fjr];
                float vyterm = vy[fjr];

                // Normalize and store
                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Update velocity
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}