#include "hip/hip_runtime.h"
#include "includes.h"

// Constant values on device
#define MAX_WEIGHT_VALUES 50
#define MIN_DET FLT_EPSILON

__constant__ __device__ int   LK_iteration;
__constant__ __device__ int   LK_patch;
__constant__ __device__ int   LK_points;
__constant__ __device__ int   LK_height;
__constant__ __device__ int   LK_width;
__constant__ __device__ int   LK_pyr_w;
__constant__ __device__ int   LK_pyr_h;
__constant__ __device__ int   LK_pyr_level;
__constant__ __device__ int   LK_width_offset;
__constant__ __device__ char  LK_init_guess;
__constant__ __device__ float LK_scaling;
__constant__ __device__ float LK_threshold;
__constant__ __device__ float LK_Weight[MAX_WEIGHT_VALUES];
__constant__ __device__ int   LK_win_size;

texture <float, 2, hipReadModeElementType> texRef_pyramid_prev;
texture <float, 2, hipReadModeElementType> texRef_pyramid_cur;
texture <float, 2, hipReadModeElementType> gpu_textr_pict_0;
texture <float, 2, hipReadModeElementType> gpu_textr_pict_1;
texture <float, 2, hipReadModeElementType> gpu_textr_deriv_x;
texture <float, 2, hipReadModeElementType> gpu_textr_deriv_y;

// Kernel to compute the tracking
__global__ void convertRGBToGrey(unsigned char *d_in, float *d_out, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (idx < N)
    {
        // Use float constants with minimal decimal to improve precision
        float blue = d_in[idx * 3] * 0.1144f;
        float green = d_in[idx * 3 + 1] * 0.5867f;
        float red = d_in[idx * 3 + 2] * 0.2989f;

        // Reduce the computation in single line to optimize memory access
        d_out[idx] = blue + green + red;
    }
}