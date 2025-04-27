#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void get_entropy(int nbins, int nsamples, int nx, float * bin_scores, int pitch_bin_scores, float * entropies)
{
    // Calculate column index of x
    int col_x = blockDim.x * blockIdx.x + threadIdx.x;

    // Return if outside the range
    if (col_x >= nx)
        return;

    // Use shared memory to store temporary results for increased memory efficiency
    extern __shared__ float shared_mem[];
    float *in_col = bin_scores + col_x * pitch_bin_scores;
    float entropy = 0.f, prob, logp;

    for (int i = 0; i < nbins; i++) {
        prob = 0.f;
        for (int j = 0; j < nsamples; j++) {
            prob += in_col[j * nbins + i];
        }
        prob /= nsamples; // Avoid casting double, it's a float operation

        logp = (prob > 0.f) ? __log2f(prob) : 0.f; // Simplify log calculation

        entropy += prob * logp;
    }

    entropies[col_x] = -entropy;
}