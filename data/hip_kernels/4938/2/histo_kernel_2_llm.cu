#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel_2 (unsigned char *buffer, int img_w, int img_h, int *histo)
{
    int id_x = blockIdx.x * blockDim.x + threadIdx.x;
    int id_y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to ensure no out-of-bounds access
    if (id_x < img_w && id_y < img_h) {
        atomicAdd(&histo[buffer[id_y * img_w + id_x]], 1);
    }
}