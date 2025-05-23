#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wlcss_cuda_kernel(int32_t *d_mss, int32_t *d_mss_offsets, int32_t *d_ts, int32_t *d_ss, int32_t *d_tlen, int32_t *d_toffsets, int32_t *d_slen, int32_t *d_soffsets, int32_t *d_params){

int params_idx = threadIdx.x;
int template_idx = blockIdx.x;
int stream_idx = blockIdx.y;

int t_len = d_tlen[template_idx];
int s_len = d_slen[stream_idx];

int t_offset = d_toffsets[template_idx];
int s_offset = d_soffsets[stream_idx];

int d_mss_offset = d_mss_offsets[params_idx*gridDim.x*gridDim.y+template_idx*gridDim.y+stream_idx];

int32_t *tmp_window = new int32_t[(t_len + 2)]();

int32_t *t = &d_ts[t_offset];
int32_t *s = &d_ss[s_offset];

int32_t *mss = &d_mss[d_mss_offset];

int32_t reward = d_params[params_idx*3];
int32_t penalty = d_params[params_idx*3+1];
int32_t accepteddist = d_params[params_idx*3+2];

int32_t tmp = 0;

for(int32_t j=0;j<s_len;j++){
for(int32_t i=0;i<t_len;i++){
int32_t distance = abs(s[j]-t[i]);
if (distance <= accepteddist){
tmp = tmp_window[i]+reward;
} else{
tmp = max(tmp_window[i]-penalty*distance,
max(tmp_window[i+1]-penalty*distance,
tmp_window[t_len+1]-penalty*distance));
}
tmp_window[i] = tmp_window[t_len+1];
tmp_window[t_len+1] = tmp;
}
tmp_window[t_len] = tmp_window[t_len+1];
mss[j] = tmp_window[t_len+1];
tmp_window[t_len+1] = 0;
}
delete [] tmp_window;

}