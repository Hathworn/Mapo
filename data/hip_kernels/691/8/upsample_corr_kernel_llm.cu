#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))

__global__ void upsample_corr_kernel(int *curr_corr, int *next_corr, int curr_h, int curr_w, int next_h, int next_w)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < next_h * next_w) {
        int next_x = id % next_w, next_y = id / next_w;

        // Precompute ratios and offsets.
        float w_ratio = (float)next_w / curr_w;
        float h_ratio = (float)next_h / curr_h;
        float w_offset = 0.5 / w_ratio;
        float h_offset = 0.5 / h_ratio;

        // Use precomputed offsets.
        int curr_x = (next_x / w_ratio) + w_offset;
        int curr_y = (next_y / h_ratio) + h_offset;

        curr_x = MAX(MIN(curr_x, curr_w-1), 0);
        curr_y = MAX(MIN(curr_y, curr_h-1), 0);

        int curr_id = curr_y * curr_w + curr_x;
        int curr_x2 = curr_corr[2 * curr_id + 0];
        int curr_y2 = curr_corr[2 * curr_id + 1];

        // Use integer arithmetic for next_x2 and next_y2.
        int next_x2 = __float2int_rn(next_x + (curr_x2 - curr_x) * w_ratio);
        int next_y2 = __float2int_rn(next_y + (curr_y2 - curr_y) * h_ratio);

        next_x2 = MAX(MIN(next_x2, next_w-1), 0);
        next_y2 = MAX(MIN(next_y2, next_h-1), 0);

        next_corr[2 * id + 0] = next_x2;
        next_corr[2 * id + 1] = next_y2;
    }
}