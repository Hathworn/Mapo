#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float Dist_between_two_vec(float *v0, float *v1, int size) {
    float dist = 0;
    for (int i = 0; i < size; i++)
        dist += (v0[i] - v1[i]) * (v0[i] - v1[i]);
    return sqrt(dist);
}

__global__ void Dist_between_two_vec_optimized(float *v0, float *v1, int size, float *dst) {
    __shared__ float shared_dist[256];  // Use shared memory for partial results
    int idx = threadIdx.x;
    shared_dist[idx] = 0;

    for (int i = idx; i < size; i += blockDim.x) {
        shared_dist[idx] += (v0[i] - v1[i]) * (v0[i] - v1[i]); 
    }

    __syncthreads();

    // Reduction to calculate the sum of squares
    if (idx == 0) {
        float dist = 0;
        for (int i = 0; i < blockDim.x; i++) {
            dist += shared_dist[i];
        }
        dst[0] = dist; 
    }
}