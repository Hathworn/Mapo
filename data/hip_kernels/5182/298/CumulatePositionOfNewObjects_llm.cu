#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CumulatePositionOfNewObjects(float* mask, float* maskNewIds, float* maskOut, int mask_size, int mask_cols, float* centers, int centers_size, int centers_columns) {
    int idx = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;  // Simplified index calculation
    int icol = idx % mask_cols;
    int irow = idx / mask_cols;

    if (idx < mask_size) {
        int i_mask = __float2int_rd(mask[idx]);  // Use fast casting
        int i_obj = __float2int_rd(maskNewIds[i_mask]);  // Use fast casting
        maskOut[idx] = (float)i_obj;  // Cast to float for maskOut

        if (i_obj * centers_columns + 2 < centers_size) {
            atomicAdd(&centers[i_obj * centers_columns + 0], (float)icol);  // Directly reference in atomicAdd
            atomicAdd(&centers[i_obj * centers_columns + 1], (float)irow);
            atomicAdd(&centers[i_obj * centers_columns + 2], 1.0f);
        }
    }
}