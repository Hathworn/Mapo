#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Calculate batch offset
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;

    // Parallelizing over m
    int index = threadIdx.x + blockIdx.y * blockDim.x; // Use 2D grid for better occupancy
    int stride = blockDim.x * gridDim.y; // Update stride based on 2D grid
    
    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];
        
        // Unroll loop partially to reduce branching
        for (int k = 0; k < n; ++k) {
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dx = x2 - x1;
            float dy = y2 - y1;
            float dz = z2 - z1;
            float d2 = dx * dx + dy * dy + dz * dz; // Avoid sqrt for distance comparison

            if (d2 < radius * radius) { // Compare squared radius
                if (cnt == 0) {
                    // Set all indices to k initially
                    for (int l = 0; l < nsample; ++l) {
                        idx[j * nsample + l] = k;
                    }
                }
                idx[j * nsample + cnt] = k;
                cnt++;

                if (cnt == nsample) break; // Break if nsample points are found
            }
        }
    }
}