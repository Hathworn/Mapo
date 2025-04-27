#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_packed_cl_cs(int *d_packed_cl, int *d_packed_cs, int *d_cl, int *d_cs, int *d_gcs, int chunk_num) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Exit early if index exceeds the number of chunks
    if (i >= chunk_num) return;

    // Check if there is a valid segment to copy
    int gcs_diff = d_gcs[i + 1] - d_gcs[i];
    if (gcs_diff > 0) {
        int index = d_gcs[i];
        d_packed_cl[index] = d_cl[i];
        d_packed_cs[index] = d_cs[i];
    }
}