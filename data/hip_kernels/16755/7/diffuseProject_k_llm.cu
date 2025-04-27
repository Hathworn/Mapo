#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    
    // Optimize loop by merging data access and computation
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                
                float2 xterm = vx[fj];
                float2 yterm = vy[fj];

                // Calculate the index of the wavenumber
                int iix = gtidx;
                int iiy = (fi > dy / 2) ? (fi - dy) : fi;

                // Velocity diffusion calculation
                float kk = (float)(iix * iix + iiy * iiy);
                float diff = 1.f / (1.f + visc * dt * kk);
                xterm.x *= diff; 
                xterm.y *= diff;
                yterm.x *= diff; 
                yterm.y *= diff;

                // Velocity projection if k^2 is greater than zero
                if (kk > 0.f) {
                    float rkk = 1.f / kk;
                    float rkp = (iix * xterm.x + iiy * yterm.x);
                    float ikp = (iix * xterm.y + iiy * yterm.y);
                    
                    float iix_rkk = rkk * iix;
                    float iiy_rkk = rkk * iiy;

                    xterm.x -= iix_rkk * rkp;
                    xterm.y -= iix_rkk * ikp;
                    yterm.x -= iiy_rkk * rkp;
                    yterm.y -= iiy_rkk * ikp;
                }

                // Store back the updated terms
                vx[fj] = xterm;
                vy[fj] = yterm;
            }
        }
    }
}