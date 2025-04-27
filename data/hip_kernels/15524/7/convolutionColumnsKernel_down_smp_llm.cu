#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float *c_Kernel;

__global__ void convolutionColumnsKernel_down_smp(float *d_Dst, float *d_Src, int imageW, int imageH, int n_imageH, int pitch, int filter_Rad, int Halo_steps)
{
    extern __shared__ float s_Data[];

    // Calculate base indices
    const int baseX = blockIdx.x * COLUMNS_BLOCKDIM_X + threadIdx.x;
    const int baseY = (blockIdx.y * 2 * COLUMNS_RESULT_STEPS - Halo_steps) * COLUMNS_BLOCKDIM_Y + threadIdx.y;
    const int baseY1 = (blockIdx.y * COLUMNS_RESULT_STEPS) * COLUMNS_BLOCKDIM_Y + threadIdx.y;

    if (baseX < imageW)
    {
        d_Src += baseY * pitch + baseX;
        d_Dst += baseY1 * pitch + baseX;
        
        // Use shared memory more efficiently with correct indexing
        int shared_mem_offset = threadIdx.x * (2 * COLUMNS_RESULT_STEPS + 2 * Halo_steps) * COLUMNS_BLOCKDIM_Y + threadIdx.y;
        
        // Load upper halo
        #pragma unroll
        for (int i = 0; i < Halo_steps; i++)
        {
            s_Data[shared_mem_offset + i * COLUMNS_BLOCKDIM_Y] = (baseY + i * COLUMNS_BLOCKDIM_Y >= 0) ? d_Src[i * COLUMNS_BLOCKDIM_Y * pitch] : 0;
        }
        
        // Load lower halo + main data
        #pragma unroll
        for (int i = Halo_steps; i < Halo_steps + 2 * COLUMNS_RESULT_STEPS + Halo_steps; i++)
        {
            s_Data[shared_mem_offset + i * COLUMNS_BLOCKDIM_Y] = (baseY + i * COLUMNS_BLOCKDIM_Y < imageH) ? d_Src[i * COLUMNS_BLOCKDIM_Y * pitch] : 0;
        }
        
        // Ensure all data is loaded into shared memory
        __syncthreads();
        
        // Compute and store results
        #pragma unroll
        for (int i = 0; i < COLUMNS_RESULT_STEPS; ++i)
        {
            float sum = 0;
            if (baseY1 + i * COLUMNS_BLOCKDIM_Y < n_imageH)
            {
                #pragma unroll
                for (int j = -filter_Rad; j <= filter_Rad; ++j)
                {
                    sum += c_Kernel[filter_Rad - j] * s_Data[shared_mem_offset + 2 * threadIdx.y + 2 * i * COLUMNS_BLOCKDIM_Y + Halo_steps * COLUMNS_BLOCKDIM_Y + j];
                }
                d_Dst[i * COLUMNS_BLOCKDIM_Y * pitch] = sum;
            }
        }
    }
}