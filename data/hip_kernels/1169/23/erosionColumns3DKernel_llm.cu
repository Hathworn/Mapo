#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void erosionColumns3DKernel(unsigned short *d_dst, unsigned short *d_src, int w, int h, int d, int kernel_radius) {
    // Use shared memory with an optimized layout for coalesced access
    __shared__ unsigned short smem[ER_COLUMNS_BLOCKDIM_Z][ER_COLUMNS_BLOCKDIM_X][(ER_COLUMNS_RESULT_STEPS + 2 * ER_COLUMNS_HALO_STEPS) * ER_COLUMNS_BLOCKDIM_Y];

    unsigned short *smem_thread = smem[threadIdx.z][threadIdx.x];

    // Calculate base indices
    const int baseX = blockIdx.x * ER_COLUMNS_BLOCKDIM_X + threadIdx.x;
    const int baseY = (blockIdx.y * ER_COLUMNS_RESULT_STEPS - ER_COLUMNS_HALO_STEPS) * ER_COLUMNS_BLOCKDIM_Y + threadIdx.y;
    const int baseZ = blockIdx.z * ER_COLUMNS_BLOCKDIM_Z + threadIdx.z;

    d_src += (baseZ * h + baseY) * w + baseX;
    d_dst += (baseZ * h + baseY) * w + baseX;

    // Load main data into shared memory
    #pragma unroll
    for (int i = ER_COLUMNS_HALO_STEPS; i < ER_COLUMNS_HALO_STEPS + ER_COLUMNS_RESULT_STEPS; i++) {
        smem_thread[threadIdx.y + i * ER_COLUMNS_BLOCKDIM_Y] = (baseY + i * ER_COLUMNS_BLOCKDIM_Y < h) ? d_src[i * ER_COLUMNS_BLOCKDIM_Y * w] : 0;
    }

    // Load upper halo
    #pragma unroll
    for (int i = 0; i < ER_COLUMNS_HALO_STEPS; i++) {
        smem_thread[threadIdx.y + i * ER_COLUMNS_BLOCKDIM_Y] = (baseY + i * ER_COLUMNS_BLOCKDIM_Y >= 0) ? d_src[i * ER_COLUMNS_BLOCKDIM_Y * w] : 0;
    }

    // Load lower halo
    #pragma unroll
    for (int i = ER_COLUMNS_HALO_STEPS + ER_COLUMNS_RESULT_STEPS; i < ER_COLUMNS_HALO_STEPS + ER_COLUMNS_RESULT_STEPS + ER_COLUMNS_HALO_STEPS; i++) {
        smem_thread[threadIdx.y + i * ER_COLUMNS_BLOCKDIM_Y] = (baseY + i * ER_COLUMNS_BLOCKDIM_Y < h) ? d_src[i * ER_COLUMNS_BLOCKDIM_Y * w] : 0;
    }

    // Synchronize threads before computation
    __syncthreads();

    // Compute and store results
    #pragma unroll
    for (int i = ER_COLUMNS_HALO_STEPS; i < ER_COLUMNS_HALO_STEPS + ER_COLUMNS_RESULT_STEPS; i++) {
        unsigned short *smem_kern = &smem_thread[threadIdx.y + i * ER_COLUMNS_BLOCKDIM_Y - kernel_radius];
        unsigned short val = smem_kern[0];

        #pragma unroll
        for (int j = 1; j <= 2 * kernel_radius; j++) {
            val = min(val, smem_kern[j]);
        }
        d_dst[i * ER_COLUMNS_BLOCKDIM_Y * w] = val;
    }
}