```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_down_after_fft(float *d_Ex, float *d_Ey, float *d_Ez, int N_grid, int N_grid_all) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int k = blockIdx.z * blockDim.z + threadIdx.z;
    int index = k * N_grid * N_grid + j * N_grid + i;

    // Simplify condition check and scale down only when inside grid bounds.
    if (index < N_grid * N_grid * N_grid) {
        float scale_factor = 1.0f / N_grid_all; // Calculate scale factor once.
        d_Ex[index] *= scale_factor;
        d_Ey[index] *= scale_factor;
        d_Ez[index] *= scale_factor;
    }
}