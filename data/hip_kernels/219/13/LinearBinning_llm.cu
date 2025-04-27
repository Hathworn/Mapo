#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearBinning(float *vec, int *bin, int *bin_counters, const int num_bins, const int MaxBin, const int n, const float slope, const float intercept)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    if (xIndex < n) {
        float temp = abs(vec[xIndex]);
        // Avoid redundant computation by computing this once
        float intercept_thresh = intercept * 0.000001f;

        if (temp > intercept_thresh) {
            // Ensure the result of max() is correctly assigned as an int
            int binValue = max(0, static_cast<int>(slope * (intercept - temp)));
            bin[xIndex] = binValue;

            // Check if binValue is within range before atomicAdd
            if (binValue < MaxBin) {
                atomicAdd(bin_counters + binValue, 1);
            }
        } else {
            bin[xIndex] = static_cast<int>(slope * intercept + 1.0f);
        }
    }
}