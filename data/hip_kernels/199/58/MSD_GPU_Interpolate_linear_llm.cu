#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MSD_GPU_Interpolate_linear(float *d_MSD_DIT, float *d_MSD_interpolated, int *d_MSD_DIT_widths, int MSD_DIT_size, int *boxcar, int max_width_performed) {
    int tid = threadIdx.x;
    if (boxcar[tid] <= max_width_performed) {
        int desired_width = boxcar[tid];
        int position = (int)floorf(log2f((float)desired_width));

        float width1 = d_MSD_DIT_widths[position];
        float mean1 = d_MSD_DIT[position * MSD_RESULTS_SIZE];
        float StDev1 = d_MSD_DIT[position * MSD_RESULTS_SIZE + 1];

        // Efficient condition check and memory access
        if (position == MSD_DIT_size - 1 && width1 == (int)desired_width) {
            d_MSD_interpolated[tid * 2] = mean1;
            d_MSD_interpolated[tid * 2 + 1] = StDev1;
        } else {
            float width2 = d_MSD_DIT_widths[position + 1];
            float distance_in_width = width2 - width1;

            float mean2 = d_MSD_DIT[(position + 1) * MSD_RESULTS_SIZE];
            float distance_in_mean = mean2 - mean1;

            float StDev2 = d_MSD_DIT[(position + 1) * MSD_RESULTS_SIZE + 1];
            float distance_in_StDev = StDev2 - StDev1;

            // Precalculate coefficients to reduce division operations
            float coeff = ((float)desired_width - width1) / distance_in_width;
            d_MSD_interpolated[tid * 2] = mean1 + distance_in_mean * coeff;
            d_MSD_interpolated[tid * 2 + 1] = StDev1 + distance_in_StDev * coeff;
        }
    }
}