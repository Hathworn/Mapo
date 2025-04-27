#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 99999.0f  // Define infinity

__device__ float Dist_between_two_vec(float *v0, float *v1, int size) {
    float dist = 0.0f;
    for (int i = 0; i < size; i++)
        dist += (v0[i] - v1[i]) * (v0[i] - v1[i]);
    return sqrtf(dist);
}

__global__ void NN_naive(float *A, int colsA, int sizeA, float *B, int colsB, int numsB, int dim, float *idx, float *dist) {
    float tmp_dist = INF;  // Initialize with defined INF
    int nn_id = -1;
    int idA = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    if (idA < sizeA) {  // Boundary check
        for (int idB = 0; idB < numsB; idB++) {
            float adist = Dist_between_two_vec(A + idA * colsA, B + idB * colsB, dim);
            if (tmp_dist > adist) {
                tmp_dist = adist;
                nn_id = idB;  // Keep idB instead of idB * colsB to match data structure
            }
        }
        dist[idA] = tmp_dist;
        idx[idA] = nn_id;
    }
}