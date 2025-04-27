#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    // Calculate unique global thread ID
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy_base = blockIdx.y * (lb * blockDim.y);
    
    // Precompute scale factor outside loop
    float scale = 1.f / (dx * dy);

    // Check boundary condition for x domain
    if (gtidx < dx) {
        for (int p = 0; p < lb; ++p) {
            int gtidy = gtidy_base + threadIdx.y * lb + p;
            
            // Check boundary condition for y domain
            if (gtidy < dy) {
                int fjr = gtidy * pdx + gtidx;
                
                // Load vxterm and vyterm, Normalize and store result
                float vxterm = vx[fjr] * scale;
                float vyterm = vy[fjr] * scale;
                
                // Directly assign normalized result to global memory
                ((float2*)((char*)v + gtidy * pitch))[gtidx] = make_float2(vxterm, vyterm);
            }
        }
    }
}