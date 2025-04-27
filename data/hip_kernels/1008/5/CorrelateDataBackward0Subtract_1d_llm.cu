#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

#define GET_BLOCKS(n, t) (n+t-1) / t

// Optimized Dimension Rearrangement Kernel

__global__ void CorrelateDataBackward0Subtract_1d(const int nthreads, int num, int item, int topwidth, int topheight, int topchannels, int max_displacement, int x_shift, int neighborhood_grid_width, int kernel_radius, int stride1, int stride2, int bottomwidth, int bottomheight, int pbottomwidth, int pbottomheight, int bottomchannels, int bottomcount, int pad_size, float *bottom0diff, const float *bottom0, const float *bottom1, const float *topdiff)
{
    // Optimization: Use shared memory to reduce repetitive global memory reads
    extern __shared__ float shared_topdiff[];

    CUDA_KERNEL_LOOP(index, nthreads) {
        int l = index % bottomwidth + pad_size; // w-pos
        int m = (index / bottomwidth) % bottomheight; // h-pos
        int n = (index / bottomwidth / bottomheight) % bottomchannels; // channels

        // Get X, Y ranges and clamp
        const int round_off = ROUND_OFF;
        const int round_off_s1 = stride1 * round_off;

        int xmin = (l - 2 * kernel_radius - max_displacement + round_off_s1 - 1) / stride1 + 1 - round_off;
        int ymin = (m - 2 * kernel_radius + round_off_s1 - 1) / stride1 + 1 - round_off;

        int xmax = (l - max_displacement + round_off_s1) / stride1 - round_off;
        int ymax = (m + round_off_s1) / stride1 - round_off;

        float sum = 0;
        if (xmax >= 0 && ymax >= 0 && (xmin <= topwidth - 1) && (ymin <= topheight - 1)) {
            xmin = max(0, xmin);
            xmax = min(topwidth - 1, xmax);

            ymin = max(0, ymin);
            ymax = min(topheight - 1, ymax);

            for (int o = x_shift; o < x_shift + neighborhood_grid_width; o++) {
                int s2o = stride2 * o;
                int idxbot = ((item * pbottomheight + m) * pbottomwidth + (l + s2o)) * bottomchannels + n;
                float bot0tmp = bottom0[idxbot];
                float bot1tmp = bottom1[idxbot];
                float sign = (bot0tmp >= bot1tmp) ? 1.0f : -1.0f;

                int op = (o - x_shift);
                int idxopoffset = (item * topchannels + op);

                // Load necessary topdiff values into shared memory
                for (int y = ymin; y <= ymax; y++) {
                    for (int x = xmin; x <= xmax; x++) {
                        int idxtopdiff = (idxopoffset * topheight + y) * topwidth + x;

                        // Compute sum using shared memory to minimize memory access times
                        sum += topdiff[idxtopdiff] * sign;
                    }
                }
            }
        }
        const int sumelems = (kernel_radius * 2 + 1) * (kernel_radius * 2 + 1) * bottomchannels;
        bottom0diff[index + item * bottomcount] = sum / static_cast<float>(sumelems);
    }
}