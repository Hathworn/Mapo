#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cn_pnpoly_naive(int* bitmap, float2* points, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        int c = 0;
        float2 p = points[i];

        int k = VERTICES - 1;

        #pragma unroll // Unroll the loop for better ILP and warp execution efficiency
        for (int j = 0; j < VERTICES; k = j++) {
            float2 vj = d_vertices[j];
            float2 vk = d_vertices[k];

            float slope = (vk.x - vj.x) / (vk.y - vj.y);

            // Using condition short-circuit property, reducing branch divergence
            if ((vj.y > p.y) != (vk.y > p.y) && 
                (p.x < slope * (p.y - vj.y) + vj.x)) {
                c = !c;
            }
        }

        bitmap[i] = c;
    }
}