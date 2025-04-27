#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params, int32_t *d_tmp_windows, int32_t *d_tmp_windows_offsets) {

    int32_t params_idx = threadIdx.x;
    int32_t template_idx = threadIdx.x;
    int32_t stream_idx = blockIdx.x;

    int32_t t_len = d_tlen[template_idx];
    int32_t s_len = d_slen[stream_idx];

    int32_t t_offset = d_toffsets[template_idx];
    int32_t s_offset = d_soffsets[stream_idx];

    int32_t d_mss_offset = d_mss_offsets[stream_idx * blockDim.x + template_idx];
    int32_t d_tmp_windows_offset = d_tmp_windows_offsets[stream_idx * blockDim.x + template_idx];

    int32_t *tmp_window = &d_tmp_windows[d_tmp_windows_offset];
    int32_t *mss = &d_mss[d_mss_offset];

    int32_t *t = &d_ts[t_offset];
    int32_t *s = &d_ss[s_offset];

    int32_t reward = d_params[params_idx * 3];
    int32_t penalty = d_params[params_idx * 3 + 1];
    int32_t accepteddist = d_params[params_idx * 3 + 2];

    // Cache t_len+1 for repeated use
    int32_t t_len_plus_1 = t_len + 1;

    for (int32_t j = 0; j < s_len; j++) {
        // Use register variable to reduce memory accesses
        int32_t last_tmp = tmp_window[t_len_plus_1];

        for (int32_t i = 0; i < t_len; i++) {
            int32_t distance = abs(s[j] - t[i]);

            if (distance <= accepteddist) {
                last_tmp = tmp_window[i] + reward;
            } else {
                last_tmp = max(tmp_window[i] - penalty * distance,
                               max(tmp_window[i + 1] - penalty * distance,
                                   last_tmp - penalty * distance));
            }

            tmp_window[i] = tmp_window[t_len_plus_1];
            tmp_window[t_len_plus_1] = last_tmp;
        }

        tmp_window[t_len] = tmp_window[t_len_plus_1];
        mss[j] = tmp_window[t_len_plus_1];
        tmp_window[t_len_plus_1] = 0; // Reset for next iteration
    }
}