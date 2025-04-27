#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Early exit if thread is outside domain in X
    if (gtidx >= dx) return;
    
    for (int p = 0; p < lb; p++) {
        // fi is the domain location in y for this thread
        int fi = gtidy + p;
        if (fi < dy) {
            int fj = fi * dx + gtidx;
            float2 pterm = part[fj];

            // Calculate indices for velocity lookup
            int xvi = min(max((int)(pterm.x * dx), 0), dx - 1);
            int yvi = min(max((int)(pterm.y * dy), 0), dy - 1);

            // Access velocity using pitch
            float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

            // Update particle position
            pterm.x = fmodf(pterm.x + dt * vterm.x + 1.f, 1.f);
            pterm.y = fmodf(pterm.y + dt * vterm.y + 1.f, 1.f);

            part[fj] = pterm;
        }
    }
}