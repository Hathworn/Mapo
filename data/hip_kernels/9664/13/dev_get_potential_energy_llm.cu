#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_get_potential_energy( float *partial_results, float eps2, float *field_m, float *fxh, float *fyh, float *fzh, float *fxt, float *fyt, float *fzt, int n_field) {
    extern __shared__ float thread_results[];
    unsigned int i, j;
    float dx, dy, dz, dr2;
    float potential_energy = 0.0f;

    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int step = blockDim.x * gridDim.x;

    // Coalesced memory access and loop unrolling
    for (j = idx; j < n_field; j += step) {
        float fxhj = fxh[j], fyhj = fyh[j], fzhj = fzh[j];
        float fxtj = fxt[j], fytj = fyt[j], fztj = fzt[j];

        #pragma unroll 4
        for (i = 0; i < j; ++i) {
            dx = (fxh[i] - fxhj) + (fxt[i] - fxtj);
            dy = (fyh[i] - fyhj) + (fyt[i] - fytj);
            dz = (fzh[i] - fzhj) + (fzt[i] - fztj);
            dr2 = dx * dx + dy * dy + dz * dz;
            float r = sqrt(eps2 + dr2);
            potential_energy -= field_m[i] * field_m[j] / r;
        }
    }

    // Reduction for potential energy within a block
    thread_results[threadIdx.x] = potential_energy;
    __syncthreads();
    for (i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            thread_results[threadIdx.x] += thread_results[threadIdx.x + i];
        }
        __syncthreads();
    }
    if (threadIdx.x == 0) {
        partial_results[blockIdx.x] = thread_results[0];
    }
}