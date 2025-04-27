#include "hip/hip_runtime.h"
#include "includes.h"

// Define optimized kernel
__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params, int32_t *d_tmp_windows, int32_t *d_tmp_windows_offsets){

    // Get indices and parameters
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

    // Initialize temporary variables
    int32_t tmp = 0;
    int32_t prev_tmp = 0;

    // Iterate over streams and templates
    for (int32_t j = 0; j < s_len; j++) {
        for (int32_t i = 0; i <= t_len; i++) {
            // Compute distance and update tmp
            int32_t distance = (i < t_len) ? abs(s[j] - t[i]) : 0;
            
            if (i < t_len && distance <= accepteddist) {
                tmp = tmp_window[i] + reward;
            } else {
                int32_t penalty_val = penalty * distance;
                tmp = max(prev_tmp - penalty_val, max(tmp_window[i] - penalty_val, tmp_window[t_len] - penalty_val));
            }
            
            // Swap update values efficently
            prev_tmp = tmp_window[i];
            tmp_window[i] = tmp;
        }

        // Store outcome and reset temporary window value
        mss[j] = tmp;
        tmp_window[t_len] = 0;
    }
}
```
