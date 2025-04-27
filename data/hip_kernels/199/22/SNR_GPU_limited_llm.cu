#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SNR_GPU_limited(float *d_FIR_input, float *d_SNR_output, ushort *d_SNR_taps, float *d_MSD, int x_steps, int nTaps, int nColumns, int offset) {
    int local_id = threadIdx.x & ( WARP - 1 );
    int warp_id = threadIdx.x >> 5;
    int dim_y = blockDim.x >> 5;
    
    int pos_x, pos_y;
    float old_SNR, new_SNR;
    
    float signal_mean = d_MSD[0];
    float signal_sd = d_MSD[1];
    
    pos_y = ( blockIdx.y * dim_y + warp_id ) * nColumns;
    pos_x = blockIdx.x * WARP * x_steps + local_id;

    // Precompute some common values outside of the loop to reduce computation inside the loop
    float base_sd_factor = signal_sd;
    int col_limit = nColumns - offset;

    for (int xf = 0; xf < x_steps; xf++) {
        if (pos_x < col_limit) {
            old_SNR = d_SNR_output[pos_y + pos_x];
            new_SNR = (d_FIR_input[pos_y + pos_x] - signal_mean) / base_sd_factor;
            if (nTaps == 1 || new_SNR > old_SNR) {  // Simplified conditional logic for nTaps
                d_SNR_output[pos_y + pos_x] = new_SNR;
                d_SNR_taps[pos_y + pos_x] = nTaps;
            }
        } else if (pos_x >= col_limit && pos_x < nColumns) {
            d_SNR_output[pos_y + pos_x] = 0;
            d_SNR_taps[pos_y + pos_x] = 0;
        }
        pos_x += WARP;  // Simplified position increment
    }
}