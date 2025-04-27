#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float Dist_between_two_vec(float * v0, float *v1, int size) {
    float dist = 0;
    for (int i = 0; i < size; i++)
        dist += (v0[i] - v1[i]) * (v0[i] - v1[i]);
    return sqrt(dist);
}

__global__ void NN_naive(float * A, int colsA, int sizeA, float * B, int colsB, int numsB, int dim, float * idx, float * dist) {
    float tmp_dist = FLT_MAX; // Use FLT_MAX for clarity and accuracy
    int nn_id = -1;
    int idA = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if (idA >= sizeA) return; // Early exit for invalid threads

    for (int idB = 0; idB < numsB; idB++) { // Use actual count of B vectors
        float adist = Dist_between_two_vec(A + colsA * idA, B + colsB * idB, dim);
        if (tmp_dist > adist) {
            tmp_dist = adist;
            nn_id = idB;
        }
    }
    if (idA < sizeA) { // Check bounds before storing results
        dist[idA] = tmp_dist;
        idx[idA] = nn_id;
    }
}