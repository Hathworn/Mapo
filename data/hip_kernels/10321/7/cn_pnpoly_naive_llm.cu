#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cn_pnpoly_naive(int* bitmap, float2* points, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        int c = 0;
        float2 p = points[i];
        
        // Unroll loop through vertices to reduce branching
        float2 vj = d_vertices[VERTICES-1];
        for (int j = 0; j < VERTICES; j++) {
            float2 vk = d_vertices[j];
            if ((vj.y > p.y) != (vk.y > p.y)) { // Simplify vertical check
                float slope = (vk.x - vj.x) / (vk.y - vj.y);
                if (p.x < slope * (p.y - vj.y) + vj.x) {
                    c = !c;
                }
            }
            vj = vk; // Move to next vertex
        }

        bitmap[i] = c; // Set bitmap value
    }
}