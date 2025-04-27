#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dev_get_potential_energy(float *partial_results, float eps2, float *field_m, float *fxh, float *fyh, float *fzh, float *fxt, float *fyt, float *fzt, int n_field) {
    extern __shared__ float thread_results[];
    unsigned int i, j;
    float dx, dy, dz, r, dr2, potential_energy = 0;

    // Use single loop with strided access to minimize divergence
    for (j = threadIdx.x + blockIdx.x * blockDim.x; j < n_field; j += blockDim.x * gridDim.x) {
        for (i = 0; i < n_field; i++) {
            if (i != j) { // Avoid self-interaction
                dx = (fxh[i] - fxh[j]) + (fxt[i] - fxt[j]);
                dy = (fyh[i] - fyh[j]) + (fyt[i] - fyt[j]);
                dz = (fzh[i] - fzh[j]) + (fzt[i] - fzt[j]);
                dr2 = dx * dx + dy * dy + dz * dz;
                r = rsqrtf(eps2 + dr2); // Use reciprocal square root for efficiency
                potential_energy -= field_m[i] * field_m[j] * r;
            }
        }
    }

    // Reduce results within block
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