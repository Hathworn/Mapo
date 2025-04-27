#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradientLayersKernel(float *d_Dst, float *d_Src, int imageW, int imageH, int imageD) {
    // Use shared memory to cache data
    __shared__ float s_Data[LAYERS_GRAD_BLOCKDIM_X][LAYERS_GRAD_BLOCKDIM_Y][(LAYERS_GRAD_RESULT_STEPS + 2 * LAYERS_GRAD_HALO_STEPS) * LAYERS_GRAD_BLOCKDIM_Z + 1];

    // Offset to the upper halo edge
    const int baseX = blockIdx.x * LAYERS_GRAD_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * LAYERS_GRAD_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = (blockIdx.z * LAYERS_GRAD_RESULT_STEPS - LAYERS_GRAD_HALO_STEPS) * LAYERS_GRAD_BLOCKDIM_Z + threadIdx.z;
    d_Src += (baseZ * imageH + baseY) * imageW + baseX;
    d_Dst += (baseZ * imageH + baseY) * imageW + baseX;

    const int pitch = imageW * imageH;

    // Load data into shared memory
    #pragma unroll
    for (int i = 0; i < LAYERS_GRAD_RESULT_STEPS + 2 * LAYERS_GRAD_HALO_STEPS; i++) {
        int zCoord = baseZ + i * LAYERS_GRAD_BLOCKDIM_Z;
        s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_GRAD_BLOCKDIM_Z] = 
            (zCoord >= 0 && zCoord < imageD) ? d_Src[i * LAYERS_GRAD_BLOCKDIM_Z * pitch] : 0.0f;
    }

    // Compute and store results
    __syncthreads();
    #pragma unroll
    for (int i = LAYERS_GRAD_HALO_STEPS; i < LAYERS_GRAD_HALO_STEPS + LAYERS_GRAD_RESULT_STEPS; i++) {
        float sum = s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_GRAD_BLOCKDIM_Z + 1]
                  - s_Data[threadIdx.x][threadIdx.y][threadIdx.z + i * LAYERS_GRAD_BLOCKDIM_Z - 1];
        sum *= 0.5f;

        d_Dst[i * LAYERS_GRAD_BLOCKDIM_Z * pitch] = sum;
    }
}