#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;
    
    // Use shared memory for particles
    extern __shared__ float2 shared_v[];

    // Pre-calculate metrics for memory access
    int threadsPerGroup = blockDim.x;
    
    // Inside domain check
    if (gtidx < dx) {
        for (p = 0; p < lb; p++) {
            int fi = gtidy + p;
            // Inside domain in Y check
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 pterm = part[fj];

                // Access velocity field
                int xvi = ((int)(pterm.x * dx)) % dx;
                int yvi = ((int)(pterm.y * dy)) % dy;
                shared_v[threadIdx.x] = *((float2*)((char*)v + yvi * pitch) + xvi);

                // Synchronize threads within this block to ensure all have loaded velocities
                __syncthreads();

                float2 vterm = shared_v[threadIdx.x];

                // Integrate particle position
                pterm.x += dt * vterm.x;
                pterm.x = fmodf(pterm.x + 1.0f, 1.0f);
                pterm.y += dt * vterm.y;
                pterm.y = fmodf(pterm.y + 1.0f, 1.0f);

                // Write back updated particle position
                part[fj] = pterm;
                
                // Synchronize to ensure all updates are complete before next loop iteration
                __syncthreads();
            }
        }
    }
}