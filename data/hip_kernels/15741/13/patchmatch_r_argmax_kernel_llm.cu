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

__global__ void patchmatch_r_argmax_kernel(float *conv, float *target, float *match, int *correspondence, int c1, int h1, int w1, int h2, int w2) {
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size1 = h1 * w1, size2 = h2 * w2;

    if (id1 < size1) {
        // Precalculate indices and reduce redundant calculations
        int baseIdx = id1 * size2;
        int corrBaseIdx = id1 * 2;

        double conv_max = -1e20;
        int best_x2 = 0, best_y2 = 0;

        for (int id2 = 0; id2 < size2; id2++) {
            float conv_result = conv[baseIdx + id2];
            if (conv_result > conv_max) {
                conv_max = conv_result;
                best_x2 = id2 % w2;
                best_y2 = id2 / w2;
            }
        }

        correspondence[corrBaseIdx + 0] = best_x2;
        correspondence[corrBaseIdx + 1] = best_y2;

        // Reduce calculation inside the loop
        for (int c = 0; c < c1; c++) {
            match[c * size1 + id1] = target[c * size2 + best_y2 * w2 + best_x2];
        }
    }
}