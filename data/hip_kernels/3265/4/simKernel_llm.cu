```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simKernel(int N_stgy, int N_batch, float *alpha, float *mid, float *gap, int *late, int *pos, int *rest_lag, float *prof, float *last_prc, int *cnt, float fee) {
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    if (global_i >= N_stgy) return;

    int start = global_i * N_batch + rest_lag[global_i];
    int end = global_i * N_batch + N_batch;
    int i;

    // Cache repeated calculations for batch indices
    for (i = start; i < end; ++i) {
        int batchIndex = i % N_batch;
        float currentAlphaMid = alpha[i] * mid[batchIndex];
        float currentGap = gap[batchIndex];

        // Optimize condition checks and arithmetic calculations
        if (currentAlphaMid > currentGap + fee || currentAlphaMid < -currentGap - fee) {
            if (currentAlphaMid > currentGap + fee && pos[global_i] < 1) {
                last_prc[global_i] = mid[batchIndex] + currentGap + fee;
                prof[global_i] -= (1 - pos[global_i]) * last_prc[global_i];
                cnt[global_i] += 1 - pos[global_i];
                pos[global_i] = 1;
                i += late[batchIndex];
            } else if (currentAlphaMid < -currentGap - fee && pos[global_i] > -1) {
                last_prc[global_i] = mid[batchIndex] - currentGap - fee;
                prof[global_i] += (pos[global_i] + 1) * last_prc[global_i];
                cnt[global_i] += pos[global_i] + 1;
                pos[global_i] = -1;
                i += late[batchIndex];
            }
        }
    }
    rest_lag[global_i] = i - end;
}