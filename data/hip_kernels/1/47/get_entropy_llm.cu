#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_entropy(int nbins, int nsamples, int nx, float *bin_scores, int pitch_bin_scores, float *entropies) {
    int col_x = blockDim.x * blockIdx.x + threadIdx.x;

    if (col_x >= nx) return;

    float *in_col = bin_scores + col_x * pitch_bin_scores;
    float entropy = 0.f;

    // Use shared memory for reduction
    extern __shared__ float shared_probs[];

    for (int i = 0; i < nbins; i++) {
        shared_probs[threadIdx.x] = 0.f;
        for (int j = threadIdx.x; j < nsamples; j += blockDim.x) {
            shared_probs[threadIdx.x] += in_col[j * nbins + i];
        }
        
        // Synchronize threads to ensure all contributions are summed
        __syncthreads();

        // Reduce within block
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (threadIdx.x < offset) {
                shared_probs[threadIdx.x] += shared_probs[threadIdx.x + offset];
            }
            __syncthreads();
        }

        if (threadIdx.x == 0) {
            float prob = shared_probs[0] / nsamples;
            float logp = (prob <= 0.f) ? 0.f : __log2f(prob);
            entropy += prob * logp;
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        entropies[col_x] = -entropy;
    }
}