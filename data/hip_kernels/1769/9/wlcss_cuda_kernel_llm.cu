#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params, int32_t *d_tmp_windows, int32_t *d_tmp_windows_offsets, int32_t *d_2d_cost_matrix) {

    int32_t params_idx = threadIdx.x;
    int32_t template_idx = blockIdx.x;
    int32_t stream_idx = blockIdx.y;

    int32_t t_len = d_tlen[template_idx];
    int32_t s_len = d_slen[stream_idx];

    int32_t t_offset = d_toffsets[template_idx];
    int32_t s_offset = d_soffsets[stream_idx];

    int32_t d_mss_offset = d_mss_offsets[params_idx * gridDim.x * gridDim.y + template_idx * gridDim.y + stream_idx];
    int32_t d_tmp_windows_offset = d_tmp_windows_offsets[params_idx * gridDim.x * gridDim.y + template_idx * gridDim.y + stream_idx];

    int32_t *tmp_window = &d_tmp_windows[d_tmp_windows_offset];
    int32_t *mss = &d_mss[d_mss_offset];

    int32_t *t = &d_ts[t_offset];
    int32_t *s = &d_ss[s_offset];

    int32_t reward = d_params[params_idx * 3];
    int32_t penalty = d_params[params_idx * 3 + 1];
    int32_t accepteddist = d_params[params_idx * 3 + 2];

    for (int32_t j = 0; j < s_len; j++) {
        int32_t prev_tmp = 0; // Temporary variable to hold the previous tmp value

        // Loop unrolling for optimization
        for (int32_t i = 0; i < t_len; i += 2) {
            int32_t distance1 = d_2d_cost_matrix[s[j] * 8 + t[i]];
            int32_t distance2 = (i + 1 < t_len) ? d_2d_cost_matrix[s[j] * 8 + t[i + 1]] : INT_MAX;

            // First element update
            int32_t tmp1 = (distance1 <= accepteddist) ? (tmp_window[i] + reward) :
               max(tmp_window[i] - penalty * distance1, max(tmp_window[i + 1] - penalty * distance1, prev_tmp - penalty * distance1));
            prev_tmp = tmp_window[i]; // Update prev_tmp after using it
            tmp_window[i] = prev_tmp;

            // Second element update (if within bounds)
            if (i + 1 < t_len) {
                int32_t tmp2 = (distance2 <= accepteddist) ? (tmp_window[i + 1] + reward) :
                   max(tmp_window[i + 1] - penalty * distance2, max(tmp_window[i + 2] - penalty * distance2, tmp1 - penalty * distance2));
                tmp_window[i + 1] = tmp2;
                prev_tmp = tmp1;
            }
        }

        mss[j] = tmp_window[t_len];
        tmp_window[t_len] = 0;
    }
}