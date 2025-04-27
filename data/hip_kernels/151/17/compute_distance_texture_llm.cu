#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_distance_texture(hipTextureObject_t ref, int ref_width, float* query, int query_width, int query_pitch, int height, float* dist) {
    // Calculate global thread indices
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < query_width && yIndex < ref_width) {
        float ssd = 0.f;
        
        // Unroll the loop for better performance
        int i = 0;
        #pragma unroll
        for (; i + 3 < height; i += 4) {
            float tmp0 = tex2D<float>(ref, (float)yIndex, (float)i) - query[i * query_pitch + xIndex];
            float tmp1 = tex2D<float>(ref, (float)yIndex, (float)(i + 1)) - query[(i + 1) * query_pitch + xIndex];
            float tmp2 = tex2D<float>(ref, (float)yIndex, (float)(i + 2)) - query[(i + 2) * query_pitch + xIndex];
            float tmp3 = tex2D<float>(ref, (float)yIndex, (float)(i + 3)) - query[(i + 3) * query_pitch + xIndex];
            ssd += tmp0 * tmp0 + tmp1 * tmp1 + tmp2 * tmp2 + tmp3 * tmp3;
        }
        
        // Handle remaining iterations
        for (; i < height; i++) {
            float tmp = tex2D<float>(ref, (float)yIndex, (float)i) - query[i * query_pitch + xIndex];
            ssd += tmp * tmp;
        }
        
        // Store the computed sum of squared differences
        dist[yIndex * query_pitch + xIndex] = ssd;
    }
}