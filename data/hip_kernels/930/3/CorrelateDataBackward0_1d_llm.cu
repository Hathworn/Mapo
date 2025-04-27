#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

#define GET_BLOCKS(n, t) (n+t-1) / t

// == Dimension rearrangement Kernel

__global__ void CorrelateDataBackward0_1d(const int nthreads, int num, int item, int topwidth, int topheight, int topchannels, int max_displacement, int x_shift, int neighborhood_grid_width, int kernel_radius, int stride1, int stride2, int bottomwidth, int bottomheight, int pbottomwidth, int pbottomheight, int bottomchannels, int bottomcount, int pad_size, float *bottom0diff, const float *bottom1, const float *topdiff)
{
    // Using shared memory for faster access
    extern __shared__ float shared_bot1[];
    CUDA_KERNEL_LOOP(index, nthreads)
    {
        int n = index % bottomchannels; 
        int l = (index / bottomchannels) % bottomwidth + pad_size; 
        int m = (index / bottomchannels / bottomwidth) % bottomheight; 

        const int round_off = ROUND_OFF;
        const int round_off_s1 = stride1 * round_off;

        int xmin = (l - 2 * kernel_radius - max_displacement + round_off_s1 - 1) / stride1 + 1 - round_off;
        int ymin = (m - 2 * kernel_radius + round_off_s1 - 1) / stride1 + 1 - round_off;

        int xmax = (l - max_displacement + round_off_s1) / stride1 - round_off;
        int ymax = (m + round_off_s1) / stride1 - round_off;

        if (xmax >= 0 && ymax >= 0 && xmin <= topwidth - 1 && ymin <= topheight - 1)
        {
            xmin = max(0, xmin);
            xmax = min(topwidth - 1, xmax);

            ymin = max(0, ymin);
            ymax = min(topheight - 1, ymax);

            float sum = 0;
            for (int o = x_shift; o < x_shift + neighborhood_grid_width; o++)
            {
                // Load bottom1 data into shared memory
                int s2o = stride2 * o;
                int idxbot1 = ((item * pbottomheight + m) * pbottomwidth + (l + s2o)) * bottomchannels + n;
                shared_bot1[threadIdx.x] = bottom1[idxbot1];
                __syncthreads(); // Ensure all threads have loaded data

                float bot1tmp = shared_bot1[threadIdx.x];

                int op = (o - x_shift);
                int idxopoffset = item * topchannels + op;

                for (int y = ymin; y <= ymax; y++)
                {
                    for (int x = xmin; x <= xmax; x++)
                    {
                        int idxtopdiff = (idxopoffset * topheight + y) * topwidth + x;
                        sum += topdiff[idxtopdiff] * bot1tmp;
                    }
                }
            }
            const int sumelems = (kernel_radius * 2 + 1) * (kernel_radius * 2 + 1) * bottomchannels;
            const int bot0index = (n * bottomheight + m) * bottomwidth + (l - pad_size);
            bottom0diff[bot0index + item * bottomcount] = sum / (float)sumelems;
        }
    }
}