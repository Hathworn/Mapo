#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void erosionLayers3DKernel( unsigned short *d_dst, unsigned short *d_src, int w, int h, int d, int kernel_radius )
{
    __shared__ unsigned short smem[ER_LAYERS_BLOCKDIM_X][ER_LAYERS_BLOCKDIM_Y][(ER_LAYERS_RESULT_STEPS + 2 * ER_LAYERS_HALO_STEPS) * ER_LAYERS_BLOCKDIM_Z + 1];
    unsigned short *smem_thread = smem[threadIdx.x][threadIdx.y];

    // Calculate base positions for source/destination pointers
    const int baseX = blockIdx.x * ER_LAYERS_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * ER_LAYERS_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = (blockIdx.z * ER_LAYERS_RESULT_STEPS - ER_LAYERS_HALO_STEPS) * ER_LAYERS_BLOCKDIM_Z + threadIdx.z;
    d_src += (baseZ * h + baseY) * w + baseX;
    d_dst += (baseZ * h + baseY) * w + baseX;

    const int pitch = w * h;

    // Load main data into shared memory
    #pragma unroll
    for (int i = ER_LAYERS_HALO_STEPS; i < ER_LAYERS_HALO_STEPS + ER_LAYERS_RESULT_STEPS; i++) {
        smem_thread[threadIdx.z + i * ER_LAYERS_BLOCKDIM_Z] = d_src[i * ER_LAYERS_BLOCKDIM_Z * pitch];
    }

    // Load upper halo into shared memory
    #pragma unroll
    for (int i = 0; i < ER_LAYERS_HALO_STEPS; i++) {
        smem_thread[threadIdx.z + i * ER_LAYERS_BLOCKDIM_Z] = (baseZ + i * ER_LAYERS_BLOCKDIM_Z >= 0) ? d_src[i * ER_LAYERS_BLOCKDIM_Z * pitch] : USHRT_MAX;
    }

    // Load lower halo into shared memory
    #pragma unroll
    for (int i = ER_LAYERS_HALO_STEPS + ER_LAYERS_RESULT_STEPS; i < ER_LAYERS_HALO_STEPS + ER_LAYERS_RESULT_STEPS + ER_LAYERS_HALO_STEPS; i++) {
        smem_thread[threadIdx.z + i * ER_LAYERS_BLOCKDIM_Z]= (baseZ + i * ER_LAYERS_BLOCKDIM_Z < d) ? d_src[i * ER_LAYERS_BLOCKDIM_Z * pitch] : USHRT_MAX;
    }

    // Synchronize to make sure data is ready for processing
    __syncthreads();

    // Compute erosion results and store them
    #pragma unroll
    for (int i = ER_LAYERS_HALO_STEPS; i < ER_LAYERS_HALO_STEPS + ER_LAYERS_RESULT_STEPS; i++) {
        unsigned short *smem_kern = &smem_thread[threadIdx.z + i * ER_LAYERS_BLOCKDIM_Z - kernel_radius];
        unsigned short val = USHRT_MAX; // Initialize with maximum value

        #pragma unroll
        for (int j = 0; j <= 2 * kernel_radius; j++) {
            val = min(val, smem_kern[j]);
        }

        d_dst[i * ER_LAYERS_BLOCKDIM_Z * pitch] = val;
    }
}