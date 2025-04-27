#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gradientRowsKernel(float *d_Dst, float *d_Src, int imageW, int imageH, int imageD) 
{
    __shared__ float s_Data[ROWS_GRAD_BLOCKDIM_Z][ROWS_GRAD_BLOCKDIM_Y][(ROWS_GRAD_RESULT_STEPS + 2 * ROWS_GRAD_HALO_STEPS) * ROWS_GRAD_BLOCKDIM_X];

    // Offset to the left halo edge
    const int baseX = (blockIdx.x * ROWS_GRAD_RESULT_STEPS - ROWS_GRAD_HALO_STEPS) * ROWS_GRAD_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * ROWS_GRAD_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = blockIdx.z * ROWS_GRAD_BLOCKDIM_Z + threadIdx.z;

    d_Src += (baseZ * imageH + baseY) * imageW + baseX;
    d_Dst += (baseZ * imageH + baseY) * imageW + baseX;

    // Load data including halos
    #pragma unroll
    for (int i = 0; i < ROWS_GRAD_RESULT_STEPS + 2 * ROWS_GRAD_HALO_STEPS; i++) {
        int offsetX = baseX + i * ROWS_GRAD_BLOCKDIM_X;
        s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * ROWS_GRAD_BLOCKDIM_X] = (offsetX >= 0 && offsetX < imageW) ? d_Src[i * ROWS_GRAD_BLOCKDIM_X] : 0.0f;
    }

    __syncthreads();

    // Compute and store results
    #pragma unroll
    for (int i = ROWS_GRAD_HALO_STEPS; i < ROWS_GRAD_HALO_STEPS + ROWS_GRAD_RESULT_STEPS; i++) {
        float sum = s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * ROWS_GRAD_BLOCKDIM_X + 1]
                  - s_Data[threadIdx.z][threadIdx.y][threadIdx.x + i * ROWS_GRAD_BLOCKDIM_X - 1];
        sum *= 0.5f;
        d_Dst[i * ROWS_GRAD_BLOCKDIM_X] = sum;
    }
}