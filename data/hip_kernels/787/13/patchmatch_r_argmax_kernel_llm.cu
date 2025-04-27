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

__global__ void patchmatch_r_argmax_kernel(float *conv, float *target, float *match, int *correspondence, int c1, int h1, int w1, int h2, int w2)
{
    int id1 = blockIdx.x * blockDim.x + threadIdx.x;
    int size1 = h1 * w1, size2 = h2 * w2;

    if (id1 >= size1) return;  // Early exit if thread out of bounds

    double conv_max = -1e20;
    int best_x2 = -1, best_y2 = -1;

    for (int id2 = 0; id2 < size2; id2++) {  // Loop unrolling over y2 and x2
        float conv_result = conv[id1 * size2 + id2];

        if (conv_result > conv_max) {
            conv_max = conv_result;
            best_x2 = id2 % w2;  // Compute x2
            best_y2 = id2 / w2;  // Compute y2
        }
    }
    
    if (conv_max > -1e20) {  // Update correspondence and match only if a valid max was found
        correspondence[id1 * 2 + 0] = best_x2;
        correspondence[id1 * 2 + 1] = best_y2;
        for (int c = 0; c < c1; c++) {
            match[c * size1 + id1] = target[c * size2 + best_y2 * w2 + best_x2];
        }
    }
}