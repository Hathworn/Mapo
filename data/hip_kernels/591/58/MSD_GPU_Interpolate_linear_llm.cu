#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MSD_GPU_Interpolate_linear(float *d_MSD_DIT, float *d_MSD_interpolated, int *d_MSD_DIT_widths, int MSD_DIT_size, int *boxcar, int max_width_performed) {
    int tid = threadIdx.x;
    int desired_width = boxcar[tid];
    
    // Exit early if condition is not met
    if (desired_width > max_width_performed) return;
    
    int position = (int)floorf(log2f((float)desired_width));
    float width1 = d_MSD_DIT_widths[position];
    float mean1 = d_MSD_DIT[position * MSD_RESULTS_SIZE];
    float StDev1 = d_MSD_DIT[position * MSD_RESULTS_SIZE + 1];
    
    if (position == MSD_DIT_size-1 && width1 == (int)desired_width) {
        d_MSD_interpolated[tid * 2] = mean1;
        d_MSD_interpolated[tid * 2 + 1] = StDev1;
    } else {
        // Cache calculations
        float width2 = d_MSD_DIT_widths[position + 1];
        float distance_in_width = width2 - width1;
        float distance_in_mean = d_MSD_DIT[(position + 1) * MSD_RESULTS_SIZE] - mean1;
        float distance_in_StDev = d_MSD_DIT[(position + 1) * MSD_RESULTS_SIZE + 1] - StDev1;

        float width_ratio = ((float)desired_width - width1) / distance_in_width;
        d_MSD_interpolated[tid * 2] = mean1 + distance_in_mean * width_ratio;
        d_MSD_interpolated[tid * 2 + 1] = StDev1 + distance_in_StDev * width_ratio;
    }
}