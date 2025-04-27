#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float do_fraction(float numer, float denom) {
    float result = 0.f;
    if((numer == denom) && (numer != 0.f))
        result = 1.f;
    else if(denom != 0.f)
        result = numer / denom;
    return result;
}

__global__ void get_bin_scores(int nbins, int order, int nknots, float *knots, int nsamples, int nx, float *x, int pitch_x, float *bins, int pitch_bins) {
    int col_x = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if the thread is within the bounds
    if(col_x >= nx) return;

    float ld, rd, z, term1, term2;
    float *in_col = x + col_x * pitch_x;
    float *bin_col = bins + col_x * pitch_bins;

    for(int k = 0; k < nsamples; k++, bin_col += nbins) {
        z = in_col[k];
        int i0 = min(nbins - 1, max(0, (int)floorf(z) + order - 1)); // Ensure i0 is within bounds

        bin_col[i0] = 1.f;
        for(int i = 2; i <= order; i++) {
            // Iterate over range ensuring j is always in valid range
            for(int j = max(0, i0 - i + 1); j <= min(i0, nbins - 1); j++) {
                if(j < nknots && j + i - 1 < nknots) {
                    ld = do_fraction(z - knots[j], knots[j + i - 1] - knots[j]);
                    term1 = ld * bin_col[j];
                } else {
                    term1 = 0.f;
                }
                
                if(j + 1 < nknots && j + i < nknots) {
                    rd = do_fraction(knots[j + i] - z, knots[j + i] - knots[j + 1]);
                    term2 = rd * bin_col[j + 1];
                } else {
                    term2 = 0.f;
                }
                
                // Combine terms to update bin_col
                bin_col[j] = term1 + term2;
            }
        }
    }
}