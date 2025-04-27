#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

#define GET_BLOCKS(n, t) (n+t-1) / t

// == Dimension rearrangement Kernel

__global__ void CorrelateDataBackward1_1d(const int nthreads, int num, int item, int topwidth, int topheight, int topchannels, int max_displacement, int x_shift, int neighborhood_grid_width, int kernel_radius, int stride1, int stride2, int bottomwidth, int bottomheight, int pbottomwidth, int pbottomheight, int bottomchannels, int bottomcount, int pad_size, const float *bottom0, float *bottom1diff, const float *topdiff)
{
    CUDA_KERNEL_LOOP(index, nthreads) {
        // Pre-calculate indices
        int n = index % bottomchannels; // channels
        int l = (index / bottomchannels) % bottomwidth + pad_size; // w-pos
        int m = (index / bottomchannels / bottomwidth) % bottomheight; // h-pos

        const int round_off = ROUND_OFF;
        const int round_off_s1 = stride1 * round_off;
        float sum = 0;

        for(int o = x_shift; o < x_shift + neighborhood_grid_width; o++) {
            int s2o = stride2 * o;

            // Calculate boundaries with clamping
            int xmin = max(0, (l - 2*kernel_radius - max_displacement - s2o + round_off_s1 - 1) / stride1 + 1 - round_off);
            int ymin = max(0, (m - 2*kernel_radius + round_off_s1 - 1) / stride1 + 1 - round_off);

            int xmax = min(topwidth-1, (l - max_displacement - s2o + round_off_s1) / stride1 - round_off);
            int ymax = min(topheight-1, (m + round_off_s1) / stride1 - round_off);

            if(xmax >= 0 && ymax >= 0 && xmin <= topwidth-1 && ymin <= topheight-1) {
                // Read bottom0 data
                int idxbot0 = ((item * pbottomheight + m) * pbottomwidth + (l - s2o)) * bottomchannels + n;
                float bot0tmp = bottom0[idxbot0];

                // Pre-calculate index offset for topdiff
                int op = (o - x_shift);
                int idxOpOffset = (item * topchannels + op);

                for(int y = ymin; y <= ymax; y++) {
                    for(int x = xmin; x <= xmax; x++) {
                        int idxtopdiff = (idxOpOffset * topheight + y) * topwidth + x;
                        sum += topdiff[idxtopdiff] * bot0tmp;
                    }
                }
            }
        }

        const int sumelems = (kernel_radius*2+1)*(kernel_radius*2+1)*bottomchannels;
        const int bot1index = ((n * bottomheight) + m) * bottomwidth + (l-pad_size);
        bottom1diff[bot1index + item*bottomcount] = sum / (float)sumelems;
    }
}