```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute(int *v1, int *v2, int *v3, int N) {
    int idx = N * blockIdx.x + threadIdx.x; // Calculate the global index once

    if(blockIdx.x == 2) {
        // Simplify the indexing calculations
        int idx_m2 = idx - 2 * N;
        int idx_m1 = idx - N;
        v3[idx] = v1[idx_m2] * v2[idx_m1] - v1[idx_m1] * v2[idx_m2];
    } else if(blockIdx.x == 1) {
        // Similar simplification for blockIdx.x == 1
        int idx_p1 = idx + N;
        v3[idx] = v1[idx_p1] * v2[idx_m1] - v1[idx_m1] * v2[idx_p1];
    } else {
        // Similar simplification for blockIdx.x == 0
        int idx_p1 = idx + N;
        int idx_p2 = idx + 2 * N;
        v3[idx] = v1[idx_p1] * v2[idx_p2] - v2[idx_p1] * v1[idx_p2];
    }
}