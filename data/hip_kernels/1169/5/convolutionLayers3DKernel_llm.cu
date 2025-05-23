#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionLayers3DKernel(float *d_Dst, float *d_Src, int imageW, int imageH, int imageD, int kernel_index, int kernel_radius)
{
    // Use thread block memory efficiently
    __shared__ float s_Data[LAYERS_BLOCKDIM_X][LAYERS_BLOCKDIM_Y][(LAYERS_RESULT_STEPS + 2 * LAYERS_HALO_STEPS) * LAYERS_BLOCKDIM_Z];

    // Offset to the upper halo edge
    const int baseX = blockIdx.x * LAYERS_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * LAYERS_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = (blockIdx.z * LAYERS_RESULT_STEPS - LAYERS_HALO_STEPS) * LAYERS_BLOCKDIM_Z + threadIdx.z;
    d_Src += (baseZ * imageH + baseY) * imageW + baseX;
    d_Dst += (baseZ * imageH + baseY) * imageW + baseX;

    const int pitch = imageW * imageH;
    const float* kernel = &c_Kernel[kernel_index * MAX_KERNEL_LENGTH];

    // Load main data
    #pragma unroll
    for (int i = LAYERS_HALO_STEPS; i < LAYERS_HALO_STEPS + LAYERS_RESULT_STEPS; i++) {
        s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_BLOCKDIM_Z] = d_Src[i * LAYERS_BLOCKDIM_Z * pitch];
    }
    
    // Load upper halo with boundary check
    #pragma unroll
    for (int i = 0; i < LAYERS_HALO_STEPS; i++) {
        s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_BLOCKDIM_Z] = (baseZ + i * LAYERS_BLOCKDIM_Z >= 0) ? d_Src[i * LAYERS_BLOCKDIM_Z * pitch] : 0.0f;
    }
    
    // Load lower halo with boundary check
    #pragma unroll
    for (int i = LAYERS_HALO_STEPS + LAYERS_RESULT_STEPS; i < LAYERS_HALO_STEPS + LAYERS_RESULT_STEPS + LAYERS_HALO_STEPS; i++) {
        s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_BLOCKDIM_Z] = (baseZ + i * LAYERS_BLOCKDIM_Z < imageD) ? d_Src[i * LAYERS_BLOCKDIM_Z * pitch] : 0.0f;
    }

    // Ensure all memory transactions are complete
    __syncthreads();

    // Compute and store results
    #pragma unroll
    for (int i = LAYERS_HALO_STEPS; i < LAYERS_HALO_STEPS + LAYERS_RESULT_STEPS; i++) {
        float sum = 0.0f;
        // Optimize inner computation loop
        #pragma unroll
        for (int j = -kernel_radius; j <= kernel_radius; j++) {
            sum += kernel[kernel_radius - j] * s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_BLOCKDIM_Z + j];
        }

        d_Dst[i * LAYERS_BLOCKDIM_Z * pitch] = sum;
    }
}