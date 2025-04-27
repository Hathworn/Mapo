#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histDupeKernel(const float* data1, const float* data2, const float* confidence1, const float* confidence2, int* ids1, int* ids2, int* results_id1, int* results_id2, float* results_similarity, int* result_count, const int N1, const int N2, const int max_results) {

    const unsigned int thread = threadIdx.x;
    const unsigned int block = blockIdx.x;
    const unsigned int block_size = blockDim.x;
    const unsigned int block_start = block_size * block;
    const unsigned int index = block_start + thread;

    float conf = (index < N1) ? confidence1[index] : 0.0f; // Guard against out-of-bounds access
    int id = (index < N1) ? ids1[index] : -1;

    __shared__ float hists[128 * 64];
    if (index < N1) { // Guard against filling shared memory beyond bounds
        for (unsigned int i = 0; i < 64; i++) {
            hists[i * 128 + thread] = data1[(block_start + i) * 128 + thread];
            hists[i * 128 + thread + 64] = data1[(block_start + i) * 128 + 64 + thread];
        }
    }

    __shared__ float other[128];

    for (unsigned int i = 0; i < N2 && *result_count < max_results; i++) {

        if (thread < 128) { // Let only threads within bounds contribute
            other[thread] = data2[i * 128 + thread];
            other[thread + 64] = data2[i * 128 + thread + 64];
        }

        __syncthreads();

        if (index < N1) { // Ensure thread is within bounds before computation
            float d = 0;
            for (unsigned int k = 0; k < 128; k++) {
                d += fabsf(hists[thread * 128 + k] - other[k]);
            }
            d = 1 - (d / 8);

            int other_id = ids2[i];

            if (other_id != id && d > fmaxf(conf, confidence2[i])) {
                int result_index = atomicAdd(result_count, 1);
                if (result_index < max_results) {
                    results_similarity[result_index] = d;
                    results_id1[result_index] = id;
                    results_id2[result_index] = other_id;
                }
            }
        }

        __syncthreads();
    }
}