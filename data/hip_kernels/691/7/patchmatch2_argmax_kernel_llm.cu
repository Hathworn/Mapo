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
    int s_n = s_size * s_size;

    if (id1 < size1) {
        float conv_max = -1;
        int x2 = prev_corrAB_upsampled[2 * id1 + 0];
        int y2 = prev_corrAB_upsampled[2 * id1 + 1];
        int best_x = x2, best_y = y2;

        // Loop unrolling for optimization
        for (int dx2 = -s_rad; dx2 <= s_rad; dx2 += 1) {
            for (int dy2 = -s_rad; dy2 <= s_rad; dy2 += 1) {
                int new_y2 = y2 + dy2;
                int new_x2 = x2 + dx2;

                if (new_x2 >= 0 && new_x2 < w1 && new_y2 >= 0 && new_y2 < h1) {
                    int s_idx = (dy2 + s_rad) * s_size + (dx2 + s_rad);
                    int id = id1 * s_n + s_idx;
                    float conv_result = conv[id];
                    if (conv_result > conv_max) {
                        conv_max = conv_result;
                        best_x = new_x2;
                        best_y = new_y2;
                    }
                }
            }
        }
        corrAB[id1 * 2 + 0] = best_x;
        corrAB[id1 * 2 + 1] = best_y;
    }

    return;
}