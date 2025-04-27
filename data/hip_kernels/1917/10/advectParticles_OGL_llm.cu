#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;

    // Use shared memory to reduce global memory access
    __shared__ float2 shared_v[BLOCK_SIZE_Y][BLOCK_SIZE_X]; 

    float2 pterm, vterm;
    
    if (gtidx < dx) {
        for (p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                pterm = part[fj];

                int xvi = ((int)(pterm.x * dx));
                int yvi = ((int)(pterm.y * dy));

                // Load velocity data into shared memory
                if (threadIdx.y < BLOCK_SIZE_Y && threadIdx.x < BLOCK_SIZE_X) {
                    shared_v[threadIdx.y][threadIdx.x] = *((float2*)((char*)v + yvi * pitch) + xvi);
                }
                __syncthreads(); // Ensure all threads have loaded the data

                // Use shared memory to compute new positions
                vterm = shared_v[threadIdx.y][threadIdx.x];
                
                pterm.x += dt * vterm.x;
                pterm.x = pterm.x - (int)pterm.x + (pterm.x < 0.f ? 1.f : 0.f);
                pterm.y += dt * vterm.y;
                pterm.y = pterm.y - (int)pterm.y + (pterm.y < 0.f ? 1.f : 0.f);

                part[fj] = pterm;
            }
        }
    }
}