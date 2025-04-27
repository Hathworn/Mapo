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

__global__ void upsample_corr_kernel(int* curr_corr, int* next_corr, int curr_h, int curr_w, int next_h, int next_w)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < next_h * next_w) {
        int next_x = id % next_w, next_y = id / next_w;

        float w_ratio = (float)next_w / curr_w;
        float h_ratio = (float)next_h / curr_h;

        int curr_x = min(max(int((next_x + 0.5) / w_ratio), 0), curr_w - 1); // Clamp curr_x
        int curr_y = min(max(int((next_y + 0.5) / h_ratio), 0), curr_h - 1); // Clamp curr_y

        int curr_id = curr_y * curr_w + curr_x;
        int curr_x2 = curr_corr[2 * curr_id];
        int curr_y2 = curr_corr[2 * curr_id + 1];

        int next_x2 = min(max(int(next_x + (curr_x2 - curr_x) * w_ratio + 0.5), 0), next_w - 1); // Clamp next_x2
        int next_y2 = min(max(int(next_y + (curr_y2 - curr_y) * h_ratio + 0.5), 0), next_h - 1); // Clamp next_y2

        next_corr[2 * id] = next_x2;
        next_corr[2 * id + 1] = next_y2;
    }
}