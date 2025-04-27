#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dwt_per_Y_O(float *d_ip, int rows, int cols, int cA_rows, int filt_len, int Halo_steps, float *d_cL, float *d_cH)
{
    extern __shared__ float s_Data[];

    // Calculate global and shared memory indices
    const int baseX = blockIdx.x * Y_BLOCKDIM_X + threadIdx.x;
    const int baseY = ((blockIdx.y * 2 * Y_RESULT_STEPS) - Halo_steps) * Y_BLOCKDIM_Y + threadIdx.y;
    const int baseY1 = (blockIdx.y * Y_RESULT_STEPS) * Y_BLOCKDIM_Y + threadIdx.y;
    const int sharedStride = (2 * Y_RESULT_STEPS + 2 * Halo_steps) * Y_BLOCKDIM_Y;
    float *s_Data_current = s_Data + threadIdx.x * sharedStride + threadIdx.y;
    
    if (baseX < cols)
    {
        // Update input pointers to point to the specific section of the array
        d_ip += baseY * cols + baseX;
        d_cL += baseY1 * cols + baseX;
        d_cH += baseY1 * cols + baseX;
        
        // Load data to shared memory, reduce conditions and bounds checks
        #pragma unroll
        for (int i = 0; i < (Halo_steps + 2 * Y_RESULT_STEPS + Halo_steps); i++)
        {
            int global_y = baseY + i * Y_BLOCKDIM_Y;
            if (global_y >= 0 && global_y < rows) 
            {
                s_Data_current[i * Y_BLOCKDIM_Y] = d_ip[i * Y_BLOCKDIM_Y * cols];
            }
            else if (global_y < 0)
            {
                s_Data_current[i * Y_BLOCKDIM_Y] = d_ip[(rows - 1) * cols];
            }
            else
            {
                s_Data_current[i * Y_BLOCKDIM_Y] = d_ip[(rows - 1) * cols];
            }
        }
        __syncthreads();
        
        // Compute results and store them
        #pragma unroll
        for (int i = 0; i < Y_RESULT_STEPS; i++)
        {
            if ((baseY1 + i * Y_BLOCKDIM_Y) < cA_rows)
            {
                float sum_cL = 0, sum_cH = 0;
                int offset = 2 * threadIdx.y + 2 * i * Y_BLOCKDIM_Y + Halo_steps * Y_BLOCKDIM_Y + (filt_len / 2);

                // Filter application using simple arithmetic operations
                #pragma unroll
                for (int l = 0; l < filt_len; ++l)
                {
                    sum_cL += c_lpd[l] * s_Data_current[offset - l];
                    sum_cH += c_hpd[l] * s_Data_current[offset - l];
                }
                d_cL[i * Y_BLOCKDIM_Y * cols] = sum_cL;
                d_cH[i * Y_BLOCKDIM_Y * cols] = sum_cH;
            }
        }
    }
}