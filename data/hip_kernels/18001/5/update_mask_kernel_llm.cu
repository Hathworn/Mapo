```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_mask_kernel(size_t batch_size, uint32_t *d_rrr_index, uint32_t *d_rrr_sets, char *d_mask, uint32_t last_seed) {
    size_t pos = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure valid thread accesses with early return
    if (pos >= batch_size) return;

    // Combine condition checks for more efficient execution
    if (d_rrr_sets[pos] == last_seed) {
        uint32_t set = d_rrr_index[pos];
        d_mask[set] = 1;
    }
}