#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128

#define DISP_MAX 256

__global__ void subpixel_enchancement(float *d0, float *c2, float *out, int size, int dim23, int disp_max) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        int d = d0[id];
        out[id] = d;
        if (1 <= d && d < disp_max - 1) {
            // Optimize memory accesses with shared memory
            extern __shared__ float shared_c2[];
            int shared_idx = threadIdx.x * 3;
            shared_c2[shared_idx] = c2[(d - 1) * dim23 + id];
            shared_c2[shared_idx + 1] = c2[d * dim23 + id];
            shared_c2[shared_idx + 2] = c2[(d + 1) * dim23 + id];

            __syncthreads();

            float cn = shared_c2[shared_idx];
            float cz = shared_c2[shared_idx + 1];
            float cp = shared_c2[shared_idx + 2];

            // Reduce redundant calculations in denom
            float denom = 2 * (cp + cn - 2 * cz);

            if (denom > 1e-5) {
                out[id] = d - min(1.0f, max(-1.0f, (cp - cn) / denom));
            }
        }
    }
}