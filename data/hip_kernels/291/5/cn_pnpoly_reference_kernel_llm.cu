#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cn_pnpoly_reference_kernel(int *bitmap, float2 *points, float2 *vertices, int n) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread corresponds to a valid point index
    if (i < n) {
        int c = 0;
        float2 p = points[i];  // Access point data
        int k = VERTICES - 1;
        
        // Loop to process each edge of the polygon
        for (int j = 0; j < VERTICES; k = j++) {
            float2 vj = vertices[j];  // Access vertex data
            float2 vk = vertices[k];
            
            // Optimize slope calculation
            float dy = vk.y - vj.y;
            float slope = dy != 0 ? (vk.x - vj.x) / dy : 0.0f;

            // Check ray intersection with polygon edge
            if (((vj.y > p.y) != (vk.y > p.y)) && (p.x < slope * (p.y - vj.y) + vj.x)) {
                c = !c;
            }
        }
        
        // Update bitmap with result
        bitmap[i] = c;  // Store result
    }
}