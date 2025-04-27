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

__global__ void patchmatch2_argmax_kernel(float *conv, int *prev_corrAB_upsampled, int *corrAB, int s_rad, int c, int h, int w)
{
    int h1 = h, w1 = w;
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size1 = h1 * w1;
    int s_size = 2 * s_rad + 1;

    if (id1 < size1) {
        float conv_max = -1;

        int x2 = prev_corrAB_upsampled[2 * id1 + 0];
        int y2 = prev_corrAB_upsampled[2 * id1 + 1];

        // Use register variables for loop limit calculations
        int x2_min = MAX(0, x2 - s_rad);
        int x2_max = MIN(w1 - 1, x2 + s_rad);
        int y2_min = MAX(0, y2 - s_rad);
        int y2_max = MIN(h1 - 1, y2 + s_rad);

        for (int dx2 = x2_min - x2; dx2 <= x2_max - x2; dx2++) {
            for (int dy2 = y2_min - y2; dy2 <= y2_max - y2; dy2++) {
                int new_x2 = x2 + dx2;
                int new_y2 = y2 + dy2;
                int s_idx = (dy2 + s_rad) * s_size + (dx2 + s_rad);
                int id = id1 * s_size * s_size + s_idx;
                float conv_result = conv[id];

                if (conv_result > conv_max) {
                    conv_max = conv_result;
                    corrAB[id1 * 2 + 0] = new_x2;
                    corrAB[id1 * 2 + 1] = new_y2;
                }
            }
        }
    }

    return;
}