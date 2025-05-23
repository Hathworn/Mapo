#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PossionImageCloningIteration(const float *fixed, const float *mask, float *input, float *output, const int wt, const int ht, const int round) {
    const int dir[16][2] = {
        {-2, -2}, {0, -2}, {2, -2},
        {-1, -1}, {0, -1}, {1, -1},
        {-2, 0}, {-1, 0}, {1, 0}, {2, 0},
        {-1, 1}, {0, 1}, {1, 1},
        {-2, 2}, {0, 2}, {2, 2}
    };
    const int coef[16] = {
        1, 1, 1,
        2, 2, 2,
        1, 2, 2, 1,
        2, 2, 2,
        1, 1, 1
    };
    const int num = 24;
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;

    // Ensure thread indices are within bounds and mask threshold is met
    if (yt < ht && xt < wt && mask[curt] > 127.0f) {
        float sum[3] = {0};

        // Optimize loop bounds checks by unrolling and removing redundant computations
        for (int i = 0; i < 16; i++) {
            int dxt = xt + dir[i][0];
            int dyt = yt + dir[i][1];

            // Check within bounds and if mask threshold is met
            if (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht) {
                int dcurt = wt * dyt + dxt;
                if (mask[dcurt] > 127.0f) {
                    // Accumulate sums directly without extra authorative checks
                    sum[0] += input[dcurt * 3 + 0] * coef[i];
                    sum[1] += input[dcurt * 3 + 1] * coef[i];
                    sum[2] += input[dcurt * 3 + 2] * coef[i];
                }
            }
        }

        // Calculate output based on accumulated sum and fixed input
        output[curt * 3 + 0] = fixed[curt * 3 + 0] + sum[0] / num;
        output[curt * 3 + 1] = fixed[curt * 3 + 1] + sum[1] / num;
        output[curt * 3 + 2] = fixed[curt * 3 + 2] + sum[2] / num;
    }
}