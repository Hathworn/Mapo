#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gradientColumnsKernel( float *d_Dst, float *d_Src, int imageW, int imageH, int imageD )
{
    __shared__ float s_Data[COLUMNS_GRAD_BLOCKDIM_Z][COLUMNS_GRAD_BLOCKDIM_X][(COLUMNS_GRAD_RESULT_STEPS + 2 * COLUMNS_GRAD_HALO_STEPS) * COLUMNS_GRAD_BLOCKDIM_Y + 1];

    // Offset calculations
    const int baseX = blockIdx.x * COLUMNS_GRAD_BLOCKDIM_X + threadIdx.x;
    const int baseY = (blockIdx.y * COLUMNS_GRAD_RESULT_STEPS - COLUMNS_GRAD_HALO_STEPS) * COLUMNS_GRAD_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = blockIdx.z * COLUMNS_GRAD_BLOCKDIM_Z + threadIdx.z;
    d_Src += (baseZ * imageH + baseY) * imageW + baseX;
    d_Dst += (baseZ * imageH + baseY) * imageW + baseX;

    // Load main data into shared memory
    #pragma unroll
    for (int i = threadIdx.y; i < COLUMNS_GRAD_BLOCKDIM_Y * (COLUMNS_GRAD_RESULT_STEPS + 2 * COLUMNS_GRAD_HALO_STEPS); i += COLUMNS_GRAD_BLOCKDIM_Y) {
        int idx = i + COLUMNS_GRAD_HALO_STEPS * COLUMNS_GRAD_BLOCKDIM_Y;
        s_Data[threadIdx.z][threadIdx.x][idx] = (baseY + i >= 0 && baseY + i < imageH) ? d_Src[i * imageW] : 0.0f;
    }
    
    // Compute and store results
    __syncthreads();
    #pragma unroll
    for (int i = COLUMNS_GRAD_HALO_STEPS; i < COLUMNS_GRAD_HALO_STEPS + COLUMNS_GRAD_RESULT_STEPS; i++) {
        int idx = threadIdx.y + i * COLUMNS_GRAD_BLOCKDIM_Y;
        float sum = 0.5f * (s_Data[threadIdx.z][threadIdx.x][idx + 1] - s_Data[threadIdx.z][threadIdx.x][idx - 1]);
        d_Dst[i * COLUMNS_GRAD_BLOCKDIM_Y * imageW] = sum;
    }
}