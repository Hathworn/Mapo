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
    if (id1 >= h1 * w1) return; // Return early if out of bounds

    int size1 = h1 * w1, size2 = h2 * w2;
    double conv_max = -1e20;
    int best_x2 = 0, best_y2 = 0; // Store best x2 and y2 to reduce memory writes

    for (int id2 = 0; id2 < size2; id2++) { // Linearize y2 and x2 loop into single loop
        float conv_result = conv[id1 * size2 + id2]; // Direct access to conv element
        if (conv_result > conv_max) { // Check if this is the best result so far
            conv_max = conv_result; // Update max convolution value
            best_x2 = id2 % w2; // Calculate candidate x2
            best_y2 = id2 / w2; // Calculate candidate y2
        }
    }
    
    // Only update correspondence and matches once after determining best match
    correspondence[id1 * 2] = best_x2;
    correspondence[id1 * 2 + 1] = best_y2;
    int best_id2 = best_y2 * w2 + best_x2; // Calculate the best id2 once
    for (int c = 0; c < c1; c++) {
        match[c * size1 + id1] = target[c * size2 + best_id2]; // Update matches
    }
}