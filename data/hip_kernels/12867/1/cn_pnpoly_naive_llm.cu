#include "hip/hip_runtime.h"
#include "includes.h"

#define VERTICES 600

__constant__ float2 d_vertices[VERTICES];
__constant__ float d_slopes[VERTICES];

#ifndef block_size_x
#define block_size_x 256
#endif
#ifndef block_size_y
#define block_size_y 1
#endif
#ifndef block_size_z
#define block_size_z 1
#endif

#ifndef tile_size
#define tile_size 1
#endif

__global__ void cn_pnpoly_naive(int* bitmap, float2* points, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        int c = 0;
        float2 p = points[i];

        // Use register to store previous vertex
        float2 vk = d_vertices[VERTICES - 1];

        for (int j = 0; j < VERTICES; j++) {
            float2 vj = d_vertices[j];

            // Precompute comparisons to reduce calculation
            bool condition1 = (vj.y > p.y) != (vk.y > p.y);
            bool condition2 = (p.x < ((vk.x - vj.x) / (vk.y - vj.y)) * (p.y - vj.y) + vj.x);

            if (condition1 && condition2) {
                c = !c;
            }

            // Move to the next vertex
            vk = vj;
        }

        bitmap[i] = c; // 0 if even (out), and 1 if odd (in)
    }
}