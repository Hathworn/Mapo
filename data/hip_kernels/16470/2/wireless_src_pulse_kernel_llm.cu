#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int is_source_gpu(int i, int j, int radius, int source_active, int src_x, int src_y)
{
    if (!source_active)
        return 0;
    if (sqrt(pow((float)(src_x - i), 2) + pow((float)(src_y - j), 2)) <= radius)
        return 1;
    return 0;
}

__global__ void wireless_src_pulse_kernel(int step, double amp, double MAX_TIME, double TIME_STEP, int radius, int source_active, int src_x, int src_y, double *ua_gpu, double *ub_gpu, double *uc_gpu)
{
    int global_thread_x = blockDim.x * blockIdx.x + threadIdx.x;
    int global_thread_y = blockDim.y * blockIdx.y + threadIdx.y;

    // Calculate the work boundary for each thread
    int i_start = global_thread_x * 32;
    int j_start = global_thread_y * 32;
    int i_final = i_start + 32;
    int j_final = j_start + 32;

    int line_length = gridDim.y * blockDim.y;

    // Check step and apply pulse source or zero out
    if (step < (int)(MAX_TIME / TIME_STEP) / 2) {
        for (int i = i_start; i < i_final; i++) {
            for (int j = j_start; j < j_final; j++) {
                if (is_source_gpu(i, j, radius, 1, src_x, src_y))
                    uc_gpu[i * line_length + j] = amp * fabs(sin(step * M_PI / 4));
            }
        }
    } else if (source_active) {
        for (int i = i_start; i < i_final; i++) {
            for (int j = j_start; j < j_final; j++) {
                if (is_source_gpu(i, j, radius, source_active, src_x, src_y)) {
                    ua_gpu[i * line_length + j] = 0;
                    ub_gpu[i * line_length + j] = 0;
                    uc_gpu[i * line_length + j] = 0;
                }
            }
        }
    }
}