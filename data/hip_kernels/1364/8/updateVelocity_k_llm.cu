#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Check if the thread is within the domain bounds in X direction
    if (gtidx < dx) {
        // Cache scale value outside the loop for reuse
        float scale = 1.f / (dx * dy);
        
        // Loop through the lb elements per thread in Y direction
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;

            // Check if the thread is within the domain bounds in Y direction
            if (fi < dy) {
                int fjr = fi * pdx + gtidx;

                // Load and normalize the velocity terms
                float vxterm = vx[fjr] * scale;
                float vyterm = vy[fjr] * scale;

                // Store the results back into the global memory
                float2 nvterm = {vxterm, vyterm};
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}