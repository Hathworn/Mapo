#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 pterm = part[fj];
                
                // Use clamping for boundary conditions
                int xvi = min(max((int)(pterm.x * dx), 0), dx - 1);
                int yvi = min(max((int)(pterm.y * dy), 0), dy - 1);
                
                // Load velocity using faster memory access pattern
                float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

                // Optimize position updates using fmodf for wrapping
                pterm.x = fmodf(pterm.x + dt * vterm.x + 1.0f, 1.0f);
                pterm.y = fmodf(pterm.y + dt * vterm.y + 1.0f, 1.0f);

                part[fj] = pterm;
            }
        }
    }
}