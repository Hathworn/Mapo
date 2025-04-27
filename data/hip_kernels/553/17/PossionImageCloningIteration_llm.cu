#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PossionImageCloningIteration(const float *fixed, const int *mask, float *input, float *output, const int wt, const int ht) {
    const int dir[16][2] = {{-2, -2},    {0, -2},    {2, -2},
                            {-1, -1},    {0, -1},    {1, -1},
                            {-2, 0},     {-1, 0},    {1, 0},     {2, 0},
                            {-1, 1},     {0, 1},     {1, 1},
                            {-2, 2},     {0, 2},     {2, 2}};
    const int coef[16] = {1, 1, 1,
                          2, 2, 2,
                          1, 2, 2, 1,
                          2, 2, 2,
                          1, 1, 1};
    const float inv_num = 1.0f / 24.0f;  // Precompute inverse of num

    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;

    if (yt < ht && xt < wt) {
        float sum[3] = {0.0f, 0.0f, 0.0f};
        
        #pragma unroll  // Unroll the loop to increase efficiency
        for (int i = 0; i < 16; i++) {
            int dxt = xt + dir[i][0];
            int dyt = yt + dir[i][1];
            if (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht) {
                int dcurt = wt * dyt + dxt;
                if (mask[dcurt]) {
                    float coefVal = static_cast<float>(coef[i]);
                    sum[0] += input[dcurt * 3 + 0] * coefVal;
                    sum[1] += input[dcurt * 3 + 1] * coefVal;
                    sum[2] += input[dcurt * 3 + 2] * coefVal;
                }
            }
        }

        output[curt * 3 + 0] = fixed[curt * 3 + 0] + sum[0] * inv_num;
        output[curt * 3 + 1] = fixed[curt * 3 + 1] + sum[1] * inv_num;
        output[curt * 3 + 2] = fixed[curt * 3 + 2] + sum[2] * inv_num;
    }
}