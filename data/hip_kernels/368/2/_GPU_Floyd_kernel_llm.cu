#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _GPU_Floyd_kernel(int k, int* G, int* P, int N) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    if (col >= N) return;

    int row = blockIdx.y;
    int idx = N * row + col;

    // Use shared memory to store elements accessed frequently
    __shared__ int best;
    if (threadIdx.x == 0) {
        best = G[N * row + k];
    }
    __syncthreads();

    // Early exit if conditions not met
    if (best == INF || best > 10) return;

    int tmp_b = G[k * N + col];
    if (tmp_b == INF || tmp_b > 10) return;

    // Calculate the shortest path
    int cur = best + tmp_b;
    // Update if a shorter path is found
    if (cur < G[idx]) {
        G[idx] = cur;
        P[idx] = k;
    }
}