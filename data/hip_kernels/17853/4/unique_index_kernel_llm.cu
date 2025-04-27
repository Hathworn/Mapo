#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unique_index_kernel(const char* flag, const int* flag_inc_sum, int* unique_index, int num_elems) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (gid < num_elems && flag[gid] == 1) { // Check boundaries and condition
        int id = flag_inc_sum[gid] - 1; // Obtain the unique index
        unique_index[id] = gid; // Assign the global index to the unique index
    }
}