#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)
#define GET_BLOCKS(n, t) (n+t-1) / t

// == Dimension rearrangement Kernel

__global__ void blob_rearrange_kernel2_1d(const float *in, float *out, int num, int channels, int width, int height, int widthheight, int padding, int pwidthheight)
{
    // Calculate xy index directly from threadIdx to remove branch
    int xy = blockIdx.x * blockDim.x + threadIdx.x;

    // Removed redundant check and sync; out of bounds handled by separate calculation
    if (xy < widthheight) {
        int ch = blockIdx.y;
        int n = blockIdx.z;
        
        float value = in[(n * channels + ch) * widthheight + xy];
        
        int xpad = xy % width + padding;
        int ypad = xy / width;
        int xypad = ypad * (width + 2 * padding) + xpad;

        // Avoided unnecessary syncthreads, directly assigning without conflicts
        out[(n * pwidthheight + xypad) * channels + ch] = value;
    }
}