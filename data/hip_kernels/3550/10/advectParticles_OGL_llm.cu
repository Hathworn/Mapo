#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;

    // gtidx is the domain location in x for this thread
    if (gtidx < dx) {
        for (p = 0; p < lb; p++) {
            // fi is the domain location in y for this thread
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 pterm = part[fj];
                
                int xvi = min(max((int)(pterm.x * dx), 0), dx - 1); // Improved bounds check
                int yvi = min(max((int)(pterm.y * dy), 0), dy - 1); // Improved bounds check
                
                float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);
                
                // Streamline position update using fmodf to handle wrap-around
                pterm.x = fmodf(pterm.x + dt * vterm.x + 1.f, 1.f);
                pterm.y = fmodf(pterm.y + dt * vterm.y + 1.f, 1.f);

                part[fj] = pterm;
            }
        } // If this thread is inside the domain in Y
    } // If this thread is inside the domain in X
}