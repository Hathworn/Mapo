#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalculateFixed( const float *background, const float *target, const float *mask, float *fixed, const int wb, const int hb, const int wt, const int ht, const int oy, const int ox )
{
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;
    
    if (yt < ht && xt < wt && mask[curt] > 127.0f) {
        // Boundary flags
        bool nt_bnd = (yt == 0), wt_bnd = (xt == 0), st_bnd = (yt == ht - 1), et_bnd = (xt == wt - 1);
        
        // Offset indices
        int North_t = (nt_bnd) ? curt : (curt - wt);
        int West_t  = (wt_bnd) ? curt : (curt - 1);
        int South_t = (st_bnd) ? curt : (curt + wt);
        int East_t  = (et_bnd) ? curt : (curt + 1);

        // Precompute repeated target index access
        const float* target_cur = target + curt * 3;
        const float* target_N   = target + North_t * 3;
        const float* target_W   = target + West_t * 3;
        const float* target_S   = target + South_t * 3;
        const float* target_E   = target + East_t * 3;

        // Compute fixed values
        float* fixed_cur = fixed + curt * 3;
        for (int i = 0; i < 3; ++i) {
            fixed_cur[i] = 4.0f * target_cur[i] - (target_N[i] + target_W[i] + target_S[i] + target_E[i]);
        }

        const int yb = oy + yt, xb = ox + xt;
        const int curb = wb * yb + xb;
        
        if (0 <= yb && yb < hb && 0 <= xb && xb < wb) {
            // Background boundary flags
            bool nb_bnd = (yb == 0), wb_bnd = (xb == 0), sb_bnd = (yb == hb - 1), eb_bnd = (xb == wb - 1);
            
            // Offset indices for background
            int North_b = (nb_bnd) ? curb : (curb - wb);
            int West_b  = (wb_bnd) ? curb : (curb - 1);
            int South_b = (sb_bnd) ? curb : (curb + wb);
            int East_b  = (eb_bnd) ? curb : (curb + 1);

            // Mask checks
            bool isMasked_n = (nt_bnd) ? true : (mask[North_t] <= 127.0f);
            bool isMasked_w = (wt_bnd) ? true : (mask[West_t] <= 127.0f);
            bool isMasked_s = (st_bnd) ? true : (mask[South_t] <= 127.0f);
            bool isMasked_e = (et_bnd) ? true : (mask[East_t] <= 127.0f);

            // Apply background additions
            float* background_N = background + North_b * 3;
            float* background_W = background + West_b * 3;
            float* background_S = background + South_b * 3;
            float* background_E = background + East_b * 3;

            if (isMasked_n) {
                for (int i = 0; i < 3; ++i) {
                    fixed_cur[i] += background_N[i];
                }
            }
            if (isMasked_w) {
                for (int i = 0; i < 3; ++i) {
                    fixed_cur[i] += background_W[i];
                }
            }
            if (isMasked_s) {
                for (int i = 0; i < 3; ++i) {
                    fixed_cur[i] += background_S[i];
                }
            }
            if (isMasked_e) {
                for (int i = 0; i < 3; ++i) {
                    fixed_cur[i] += background_E[i];
                }
            }
        }
    }
}