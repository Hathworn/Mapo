#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionColumns3DKernel( float *d_Dst, float *d_Src, int imageW, int imageH, int imageD, int kernel_index, int kernel_radius )
{
    __shared__ float s_Data[COLUMNS_BLOCKDIM_Z][COLUMNS_BLOCKDIM_X][(COLUMNS_RESULT_STEPS + 2 * COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y + 1];

    //Offset to the upper halo edge
    const int baseX = blockIdx.x * COLUMNS_BLOCKDIM_X + threadIdx.x;
    const int baseY = (blockIdx.y * COLUMNS_RESULT_STEPS - COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = blockIdx.z * COLUMNS_BLOCKDIM_Z + threadIdx.z;
    d_Src += (baseZ * imageH + baseY) * imageW + baseX;
    d_Dst += (baseZ * imageH + baseY) * imageW + baseX;

    const float* kernel = &c_Kernel[kernel_index*MAX_KERNEL_LENGTH];

    // Load data into shared memory
    #pragma unroll
    for (int i = 0; i < COLUMNS_RESULT_STEPS + 2 * COLUMNS_HALO_STEPS; ++i) {
        int yIndex = baseY + (i - COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y;
        s_Data[threadIdx.z][threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y] = 
            (yIndex >= 0 && yIndex < imageH) ? d_Src[(i - COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y * imageW] : 0;
    }

    // Synchronize to make sure all threads have loaded their data
    __syncthreads();

    // Compute and store results
    #pragma unroll
    for (int i = COLUMNS_HALO_STEPS; i < COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS; i++) {
        float sum = 0;
        #pragma unroll
        for (int j = -kernel_radius; j <= kernel_radius; j++) {
            sum += kernel[kernel_radius - j] * s_Data[threadIdx.z][threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y + j];
        }
        d_Dst[i * COLUMNS_BLOCKDIM_Y * imageW] = sum;
    }
}
```
