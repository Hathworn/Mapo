```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalculateFixed(const float* subBG, const float* subT, const int* subM, float* fixed, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox) {
    const int dir[16][2] = {
        {-2, -2}, {0, -2}, {2, -2},
        {-1, -1}, {0, -1}, {1, -1},
        {-2, 0}, {-1, 0}, {1, 0}, {2, 0},
        {-1, 1}, {0, 1}, {1, 1},
        {-2, 2}, {0, 2}, {2, 2}
    };
    const int coef[16] = {1, 1, 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, 2, 1, 1, 1};
    const int num = 24;
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;

    if (yt < ht && xt < wt) {
        float sum[3] = {0.0f};
        float bsum[3] = {0.0f};

        for (int i = 0; i < 16; ++i) {
            int dxt = xt + dir[i][0];
            int dyt = yt + dir[i][1];
            int dcurt = wt * dyt + dxt;

            int dxb = ox + dxt;
            int dyb = oy + dyt;

            bool withinBounds = (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht);

            // Conditional accumulation for subT based on bounds
            sum[0] += ((withinBounds) ? subT[dcurt * 3 + 0] : subT[curt * 3 + 0]) * coef[i];
            sum[1] += ((withinBounds) ? subT[dcurt * 3 + 1] : subT[curt * 3 + 1]) * coef[i];
            sum[2] += ((withinBounds) ? subT[dcurt * 3 + 2] : subT[curt * 3 + 2]) * coef[i];

            if (!withinBounds || !subM[dcurt]) {
                // Clamp boundaries for subBG index
                dxb = max(0, min(dxb, wb - 1));
                dyb = max(0, min(dyb, hb - 1));
                int dcurb = wb * dyb + dxb;

                // Accumulate weighted subBG values
                bsum[0] += subBG[dcurb * 3 + 0] * coef[i];
                bsum[1] += subBG[dcurb * 3 + 1] * coef[i];
                bsum[2] += subBG[dcurb * 3 + 2] * coef[i];
            }
        }

        // Compute fixed values normalized by num
        fixed[curt * 3 + 0] = subT[curt * 3 + 0] - sum[0] / num + bsum[0] / num;
        fixed[curt * 3 + 1] = subT[curt * 3 + 1] - sum[1] / num + bsum[1] / num;
        fixed[curt * 3 + 2] = subT[curt * 3 + 2] - sum[2] / num + bsum[2] / num;
    }
}