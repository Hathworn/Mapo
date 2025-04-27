```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    float kk, diff, rkk, rkp, ikp;
    int iix = gtidx;
    
    // Precompute dy/2 for efficiency
    int half_dy = dy / 2;
    
    // Combine if-conditions to improve GPU execution coherence
    if (gtidx < dx && gtidy < dy) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 xterm = vx[fj];
                float2 yterm = vy[fj];
                int iiy = (fi > half_dy) ? (fi - dy) : fi;
                
                // Computation of wave number and its components
                kk = (float)(iix * iix + iiy * iiy); // k^2
                diff = 1.f / (1.f + visc * dt * kk);
                xterm.x *= diff; xterm.y *= diff;
                yterm.x *= diff; yterm.y *= diff;

                // Apply velocity projection only if kk > 0
                if (kk > 0.f) {
                    rkk = 1.f / kk;
                    rkp = (iix * xterm.x + iiy * yterm.x);
                    ikp = (iix * xterm.y + iiy * yterm.y);
                    xterm.x -= rkk * rkp * iix;
                    xterm.y -= rkk * ikp * iix;
                    yterm.x -= rkk * rkp * iiy;
                    yterm.y -= rkk * ikp * iiy;
                }

                // Store the computed results back
                vx[fj] = xterm;
                vy[fj] = yterm;
            }
        }
    }
}