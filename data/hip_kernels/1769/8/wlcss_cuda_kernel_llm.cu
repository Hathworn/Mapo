#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params, int32_t *d_3d_cost_matrix) {

    int32_t params_idx = threadIdx.x;
    int32_t template_idx = blockIdx.x;
    int32_t stream_idx = blockIdx.y;

    int32_t t_len = d_tlen[template_idx];
    int32_t s_len = d_slen[stream_idx];

    int32_t t_offset = d_toffsets[template_idx];
    int32_t s_offset = d_soffsets[stream_idx];

    int32_t d_mss_offset = d_mss_offsets[params_idx * gridDim.x * gridDim.y + template_idx * gridDim.y + stream_idx];
    int32_t *mss = &d_mss[d_mss_offset];

    extern __shared__ int32_t shared_tmp_window[]; // Use shared memory for better performance

    int32_t *t = &d_ts[t_offset];
    int32_t *s = &d_ss[s_offset];

    int32_t reward = d_params[params_idx * 3];
    int32_t penalty = d_params[params_idx * 3 + 1];
    int32_t accepteddist = d_params[params_idx * 3 + 2];

    for(int32_t j = 0; j < s_len; j++) {
        int32_t tmp = 0; // Moved inside the first loop for improved locality
        for(int32_t i = 0; i < t_len; i++) {
            int32_t distance = d_3d_cost_matrix[s[j] * 26 + t[i]];
            if (distance <= accepteddist) {
                tmp = shared_tmp_window[i] + reward;
            } else {
                tmp = max(shared_tmp_window[i] - penalty * distance,
                          max(shared_tmp_window[i + 1] - penalty * distance,
                              shared_tmp_window[t_len + 1] - penalty * distance));
            }
            shared_tmp_window[i] = shared_tmp_window[t_len + 1];
            shared_tmp_window[t_len + 1] = tmp;
        }
        shared_tmp_window[t_len] = shared_tmp_window[t_len + 1];
        mss[j] = shared_tmp_window[t_len + 1];
        shared_tmp_window[t_len + 1] = 0; // Reset for the next iteration
    }
}