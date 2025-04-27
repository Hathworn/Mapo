#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PossionImageCloningIteration(const float *fixed, const float *mask, float *input, float *output, const int wt, const int ht) {
    const int dir[4][2] = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}};
    int num = 4;
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;

    // Optimization: Early return if thread is out of bounds or mask value is insufficient
    if (yt >= ht || xt >= wt || mask[curt] <= 127.0f) return;

    float sum[3] = {0};

    // Unrolling loop for performance improvement
    #pragma unroll
    for (int i = 0; i < 4; i++) {
        int dxt = xt + dir[i][0];
        int dyt = yt + dir[i][1];
        int dcurt = wt * dyt + dxt;
        if (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht && mask[dcurt] > 127.0f) {
            sum[0] += input[dcurt * 3 + 0];
            sum[1] += input[dcurt * 3 + 1];
            sum[2] += input[dcurt * 3 + 2];
        }
    }

    // Pre-compute index to reduce repetitive calculations
    int outputIndex = curt * 3;
    output[outputIndex + 0] = fixed[outputIndex + 0] + sum[0] / num;
    output[outputIndex + 1] = fixed[outputIndex + 1] + sum[1] / num;
    output[outputIndex + 2] = fixed[outputIndex + 2] + sum[2] / num;
}