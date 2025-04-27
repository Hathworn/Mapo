#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simKernel(int N_stgy, int N_batch, double *alpha, double *mid, double *gap, int *late, int *pos, int *rest_lag, double *prof, double *last_prc, int *cnt, double fee) {
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    if (global_i >= N_stgy) return;

    int start = global_i * N_batch + rest_lag[global_i];
    int end = global_i * N_batch + N_batch;
    
    // Loop optimization: reduce redundant calculations
    for (int i = start; i < end; ++i) {
        double alpha_mid = alpha[i] * mid[i % N_batch];
        double gap_fee = gap[i % N_batch] + fee;

        if (alpha_mid > gap_fee || alpha_mid < -gap_fee) {
            double mid_value = mid[i % N_batch];
            double gap_value = gap[i % N_batch];
            
            if (alpha_mid > gap_fee && pos[global_i] < 1) {
                last_prc[global_i] = mid_value + gap_value + fee;
                prof[global_i] -= (1 - pos[global_i]) * last_prc[global_i];
                cnt[global_i] += 1 - pos[global_i];
                pos[global_i] = 1;
                i += late[i % N_batch];
            } else if (alpha_mid < -gap_fee && pos[global_i] > -1) {
                last_prc[global_i] = mid_value - gap_value - fee;
                prof[global_i] += (pos[global_i] + 1) * last_prc[global_i];
                cnt[global_i] += pos[global_i] + 1;
                pos[global_i] = -1;
                i += late[i % N_batch];
            }
        }
    }
    rest_lag[global_i] = end - (global_i * N_batch); // Ensures proper reset of rest_lag
}