#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params, int32_t *d_tmp_windows, int32_t *d_tmp_windows_offsets, int32_t *d_3d_cost_matrix){

    int32_t params_idx = threadIdx.x;
    int32_t template_idx = blockIdx.x;
    int32_t stream_idx = blockIdx.y;

    int32_t t_len = d_tlen[template_idx];
    int32_t s_len = d_slen[stream_idx];

    int32_t t_offset = d_toffsets[template_idx];
    int32_t s_offset = d_soffsets[stream_idx];

    int32_t d_mss_offset = d_mss_offsets[params_idx*gridDim.x*gridDim.y+template_idx*gridDim.y+stream_idx];
    int32_t d_tmp_windows_offset = d_tmp_windows_offsets[params_idx*gridDim.x*gridDim.y+template_idx*gridDim.y+stream_idx];

    int32_t *tmp_window = &d_tmp_windows[d_tmp_windows_offset];
    int32_t *mss = &d_mss[d_mss_offset];

    int32_t *t = &d_ts[t_offset];
    int32_t *s = &d_ss[s_offset];

    int32_t reward = d_params[params_idx*3];
    int32_t penalty = d_params[params_idx*3+1];
    int32_t accepteddist = d_params[params_idx*3+2];

    // Variables moved outside the loop
    int32_t tmp = 0;
    int32_t tmp_window_next;
    int32_t t_val, s_val, distance;

    // Use shared memory to reduce global memory access
    __shared__ int32_t shared_tmp_window[1024]; // Assuming max t_len is 1024 for illustration
    
    for(int32_t j = 0; j < s_len; j++){
        s_val = s[j];

        // Load initial part of tmp_window into shared memory
        for (int i = threadIdx.x; i <= t_len; i += blockDim.x) {
            shared_tmp_window[i] = tmp_window[i];
        }
        __syncthreads();

        for(int32_t i = 0; i < t_len; i++){
            t_val = t[i];
            distance = d_3d_cost_matrix[s_val * 26 + t_val];
            
            // Perform calculations using shared memory
            tmp_window_next = (distance <= accepteddist) ? 
                shared_tmp_window[i] + reward : 
                max(shared_tmp_window[i] - penalty * distance,
                    max(shared_tmp_window[i + 1] - penalty * distance, 
                    shared_tmp_window[t_len + 1] - penalty * distance));
            
            __syncthreads();
            shared_tmp_window[i] = shared_tmp_window[t_len + 1];
            shared_tmp_window[t_len + 1] = tmp_window_next;
            __syncthreads();
        }

        __syncthreads();
        // Synchronize and write results back to global memory
        if (threadIdx.x == 0) {
            shared_tmp_window[t_len] = shared_tmp_window[t_len + 1];
            mss[j] = shared_tmp_window[t_len + 1];
            shared_tmp_window[t_len + 1] = 0;
        }
        __syncthreads();
        
        for (int i = threadIdx.x; i <= t_len; i += blockDim.x) {
            tmp_window[i] = shared_tmp_window[i];
        }
        __syncthreads();
    }
}