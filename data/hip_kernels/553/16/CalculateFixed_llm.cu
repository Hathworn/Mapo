#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalculateFixed(const float *subBG, const float *subT, const int *subM, float *fixed, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox) {
    // Precompute directional and coefficient values
    __shared__ int dir[16][2];
    __shared__ int coef[16];
    if (threadIdx.x < 16) {
        dir[threadIdx.x][0] = (threadIdx.x < 3) ? threadIdx.x * 2 - 2 : (threadIdx.x - 4) % 3 - 1;
        dir[threadIdx.x][1] = (threadIdx.x < 3) ? -2 : ((threadIdx.x < 6) ? -1 : ((threadIdx.x == 8 || threadIdx.x == 12) ? 0 : ((threadIdx.x < 15) ? 1 : 2)));
        coef[threadIdx.x] = (threadIdx.x % 3 == 0) ? 1 : 2;
    }
    __syncthreads();

    const int num = 24;
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;

    if (yt < ht && xt < wt) {
        float sum[3] = {0}, bsum[3] = {0};

        // Loop through all directions
        for (int i = 0; i < 16; i++) {
            int dxt = xt + dir[i][0];
            int dyt = yt + dir[i][1];
            int dcurt = wt * dyt + dxt;
            int dxb = ox + dxt;
            int dyb = oy + dyt;

            bool inBounds = (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht);

            // Texture background contributions
            float coef_val = coef[i];
            sum[0] += subT[(inBounds ? dcurt : curt) * 3 + 0] * coef_val;
            sum[1] += subT[(inBounds ? dcurt : curt) * 3 + 1] * coef_val;
            sum[2] += subT[(inBounds ? dcurt : curt) * 3 + 2] * coef_val;

            // Background contributions
            if (!inBounds || !subM[inBounds ? dcurt : curt]) {
                dxb = max(min(dxb, wb - 1), 0);
                dyb = max(min(dyb, hb - 1), 0);
                int dcurb = wb * dyb + dxb;
                bsum[0] += subBG[dcurb * 3 + 0] * coef_val;
                bsum[1] += subBG[dcurb * 3 + 1] * coef_val;
                bsum[2] += subBG[dcurb * 3 + 2] * coef_val;
            }
        }

        // Compute fixed values
        fixed[curt * 3 + 0] = subT[curt * 3 + 0] - sum[0] / num + bsum[0] / num;
        fixed[curt * 3 + 1] = subT[curt * 3 + 1] - sum[1] / num + bsum[1] / num;
        fixed[curt * 3 + 2] = subT[curt * 3 + 2] - sum[2] / num + bsum[2] / num;
    }
}