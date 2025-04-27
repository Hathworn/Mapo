#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void padding(int *op, int *ip, int N, int C, int H, int W, int Py, int Px) {
    // Calculate unique thread index across the grid
    unsigned int input_id = blockIdx.x * (gridDim.y * gridDim.z) * blockDim.x + blockIdx.y * (gridDim.z * blockDim.x) + blockIdx.z * blockDim.x + threadIdx.x;

    // Early return if out of bounds
    if (input_id >= N * C * H * W) return;

    // Calculate indices
    int i = input_id / (C * H * W);
    input_id %= (C * H * W);
    int j = input_id / (H * W);
    input_id %= (H * W);
    int k = input_id / W;
    int l = input_id % W;

    // Perform the padding operation
    op[i * C * (H + 2 * Py) * (W + 2 * Px) + j * (H + 2 * Py) * (W + 2 * Px) + (k + Py) * (W + 2 * Px) + (l + Px)] = ip[i * C * H * W + j * H * W + k * W + l];
}