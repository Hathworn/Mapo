#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    // Calculate global thread indices
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Return early if gtidx is out of bounds
    if (gtidx >= dx) return;

    for (int p = 0; p < lb; p++) {
        // Compute global y-index with batching
        int fi = gtidy * lb + p;
        
        if (fi < dy) {
            int fj = fi * dx + gtidx;
            float2 xterm = vx[fj];
            float2 yterm = vy[fj];
            
            // Calculate wave numbers
            int iix = gtidx;
            int iiy = (fi > dy / 2) ? (fi - dy) : fi;
            
            // Velocity diffusion
            float kk = static_cast<float>(iix * iix + iiy * iiy);
            float diff = 1.f / (1.f + visc * dt * kk);
            xterm.x *= diff; xterm.y *= diff;
            yterm.x *= diff; yterm.y *= diff;

            // Velocity projection
            if (kk > 0.f) {
                float rkk = 1.f / kk;
                float rkp = (iix * xterm.x + iiy * yterm.x);
                float ikp = (iix * xterm.y + iiy * yterm.y);
                
                // Apply projection results
                xterm.x -= rkk * rkp * iix;
                xterm.y -= rkk * ikp * iix;
                yterm.x -= rkk * rkp * iiy;
                yterm.y -= rkk * ikp * iiy;
            }
            
            // Store updated terms back to global memory
            vx[fj] = xterm;
            vy[fj] = yterm;
        }
    }
}