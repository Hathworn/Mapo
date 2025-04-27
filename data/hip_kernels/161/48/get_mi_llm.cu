```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_mi(int nbins, int nsamples, int nx, float * x_bin_scores, int pitch_x_bin_scores, float * entropies_x, int ny, float * y_bin_scores, int pitch_y_bin_scores, float * entropies_y, float * mis, int pitch_mis)
{
    int col_x = blockDim.x * blockIdx.x + threadIdx.x;
    int col_y = blockDim.y * blockIdx.y + threadIdx.y;

    // Bounds check
    if((col_x >= nx) || (col_y >= ny))
        return;

    float mi = 0.f;
    float * x_bins = x_bin_scores + col_x * pitch_x_bin_scores;
    float * y_bins = y_bin_scores + col_y * pitch_y_bin_scores;

    // Optimize memory access and arithmetic operations
    for(int i = 0; i < nbins; i++) {
        float x_sum = 0.f;
        for(int k = 0; k < nsamples; k++)
            x_sum += x_bins[k * nbins + i];

        for(int j = 0; j < nbins; j++) {
            float y_sum = 0.f;
            for(int k = 0; k < nsamples; k++)
                y_sum += y_bins[k * nbins + j];

            float prob = (x_sum * y_sum) / (float)(nsamples * nsamples);

            // Use fma to potentially increase accuracy and efficiency
            mi = fmaf(prob, (prob > 0.f) ? __log2f(prob) : 0.f, mi);
        }
    }

    // Calculate mi from entropies
    mi += entropies_x[col_x] + entropies_y[col_y];
    (mis + col_y * pitch_mis)[col_x] = mi;
}