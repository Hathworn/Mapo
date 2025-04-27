#include "hip/hip_runtime.h"
#include "includes.h"

#define BIN_WIDTH 0.25
#define BLOCK_DIM 256
#define COVERAGE 180
#define LINE_LENGTH 30

#define BINS_TOTAL (COVERAGE * (int)(1 / BIN_WIDTH))

typedef struct Galaxy
{
    float declination;
    float declination_cos;
    float declination_sin;
    float right_ascension;
} Galaxy;

__global__ void measure_galaxy_distribution(int *DD_histogram, int *DR_histogram, int *RR_histogram, float *distribution, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling for increased performance
    for (int i = index; i < n; i += stride * 4) {
        if (i < n && RR_histogram[i] != 0) {
            distribution[i] = (DD_histogram[i] - 2.0f * DR_histogram[i] + RR_histogram[i]) / RR_histogram[i];
        }
        if (i + stride < n && RR_histogram[i + stride] != 0) {
            distribution[i + stride] = (DD_histogram[i + stride] - 2.0f * DR_histogram[i + stride] + RR_histogram[i + stride]) / RR_histogram[i + stride];
        }
        if (i + 2 * stride < n && RR_histogram[i + 2 * stride] != 0) {
            distribution[i + 2 * stride] = (DD_histogram[i + 2 * stride] - 2.0f * DR_histogram[i + 2 * stride] + RR_histogram[i + 2 * stride]) / RR_histogram[i + 2 * stride];
        }
        if (i + 3 * stride < n && RR_histogram[i + 3 * stride] != 0) {
            distribution[i + 3 * stride] = (DD_histogram[i + 3 * stride] - 2.0f * DR_histogram[i + 3 * stride] + RR_histogram[i + 3 * stride]) / RR_histogram[i + 3 * stride];
        }
    }
}