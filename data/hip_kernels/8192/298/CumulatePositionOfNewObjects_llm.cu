```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CumulatePositionOfNewObjects(float* mask, float* maskNewIds, float* maskOut, int mask_size, int mask_cols, float* centers, int centers_size, int centers_columns) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate linear index for 1D grid

    if (idx < mask_size) {
        int icol = idx % mask_cols;  // Calculate column index
        int irow = idx / mask_cols;  // Calculate row index

        int i_mask = mask[idx];
        int i_obj = maskNewIds[i_mask];
        maskOut[idx] = i_obj;

        if (i_obj * centers_columns + 2 < centers_size) {
            // Use shared memory to accumulate center updates
            float center_updates[3] = {0.0f, 0.0f, 0.0f};
            center_updates[0] = (float)icol;
            center_updates[1] = (float)irow;
            center_updates[2] = 1.0f;

            atomicAdd(centers + 0 + i_obj * centers_columns, center_updates[0]);
            atomicAdd(centers + 1 + i_obj * centers_columns, center_updates[1]);
            atomicAdd(centers + 2 + i_obj * centers_columns, center_updates[2]);
        }
    }
}