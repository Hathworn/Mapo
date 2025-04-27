#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube_select(int b, int n, float radius, const float* xyz, int* idx_out) {
    int batch_idx = blockIdx.x;
    xyz += batch_idx * n * 3;
    idx_out += batch_idx * n * 8;
    float judge_dist = radius * radius;

    for(int i = threadIdx.x; i < n; i += blockDim.x) {
        float x = xyz[i * 3];
        float y = xyz[i * 3 + 1];
        float z = xyz[i * 3 + 2];
        
        float temp_dist[8]; // Store smallest distances for each region
        #pragma unroll // Enable loop unrolling for optimization
        for(int j = 0; j < 8; j++) {
            temp_dist[j] = 1e8;
            idx_out[i * 8 + j] = i; // initialize with self index
        }

        for(int j = 0; j < n; j++) {
            if(i == j) continue;

            float tx = xyz[j * 3];
            float ty = xyz[j * 3 + 1];
            float tz = xyz[j * 3 + 2];
            float dist = (x - tx) * (x - tx) + (y - ty) * (y - ty) + (z - tz) * (z - tz);

            if(dist > judge_dist) continue;

            int temp_idx = ((tx > x) << 2) | ((ty > y) << 1) | (tz > z); // Optimize index calculation

            if(dist < temp_dist[temp_idx]) {
                idx_out[i * 8 + temp_idx] = j;
                temp_dist[temp_idx] = dist;
            }
        }
    }
}