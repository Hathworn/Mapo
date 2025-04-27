#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalculateFixed(const float *background, const float *target, const float *mask, float *fixed, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox) {
    const int dir[4][2] = { {0, -1}, {1, 0}, {0, 1}, {-1, 0}};
    int num = 4;
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;
    
    if (yt < ht && xt < wt && mask[curt] > 127.0f) {
        float sum[3] = {0.0f, 0.0f, 0.0f};
        float bsum[3] = {0.0f, 0.0f, 0.0f};
        
        // Reduce recalculations of indices
        int target_base = curt * 3;
        float target_val[3] = { target[target_base], target[target_base + 1], target[target_base + 2] };
        
        for (int i = 0; i < 4; i++) {
            int dxt = xt + dir[i][0], dyt = yt + dir[i][1];
            
            if (dxt >= 0 && dxt < wt && dyt >= 0 && dyt < ht) {
                int dcurt = wt * dyt + dxt;
                int dtarget_base = dcurt * 3;
                
                sum[0] += target[dtarget_base];
                sum[1] += target[dtarget_base + 1];
                sum[2] += target[dtarget_base + 2];
                
                if (mask[dcurt] >= 127.0f) continue;
            } else {
                sum[0] += target_val[0];
                sum[1] += target_val[1];
                sum[2] += target_val[2];
            }
            
            int dxb = max(min(ox + dxt, wb - 1), 0);
            int dyb = max(min(oy + dyt, hb - 1), 0);
            int dcurb = wb * dyb + dxb;
            int dbackground_base = dcurb * 3;
            
            bsum[0] += background[dbackground_base];
            bsum[1] += background[dbackground_base + 1];
            bsum[2] += background[dbackground_base + 2];
        }

        fixed[target_base] = target_val[0] - sum[0] / num + bsum[0] / num;
        fixed[target_base + 1] = target_val[1] - sum[1] / num + bsum[1] / num;
        fixed[target_base + 2] = target_val[2] - sum[2] / num + bsum[2] / num;
    }
}