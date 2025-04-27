#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

#define GET_BLOCKS(n, t) ((n) + (t) - 1) / (t)

// == Dimension rearrangement Kernel

__global__ void CorrelateDataBackward1Subtract_1d(const int nthreads, int num, int item, int topwidth, int topheight, int topchannels, 
                                                   int max_displacement, int x_shift, int neighborhood_grid_width, int kernel_radius, 
                                                   int stride1, int stride2, int bottomwidth, int bottomheight, int pbottomwidth, 
                                                   int pbottomheight, int bottomchannels, int bottomcount, int pad_size, 
                                                   const float *bottom0, const float *bottom1, float *bottom1diff, const float *topdiff)
{
    CUDA_KERNEL_LOOP(index, nthreads) {
        
        int l = index % bottomwidth + pad_size; // w-pos
        int m = (index / bottomwidth) % bottomheight; // h-pos
        int n = (index / bottomwidth / bottomheight) % bottomchannels; // channels

        // Precompute some values to reduce repeated calculations
        const int round_off = ROUND_OFF;
        const int round_off_s1 = stride1 * round_off;
        const int m_offset = m * pbottomwidth;
        const int idxBase = ((item * pbottomheight + m) * pbottomwidth + l);

        float sum = 0;
        for(int o = x_shift; o < x_shift + neighborhood_grid_width; o++) {

            int s2o = stride2 * o;
            int idxBotO = idxBase - s2o;

            // Calculate ranges and clamp them
            int xmin = max(0, (l - 2 * kernel_radius - max_displacement - s2o + round_off_s1 - 1) / stride1 + 1 - round_off);
            int ymin = max(0, (m - 2 * kernel_radius + round_off_s1 - 1) / stride1 + 1 - round_off);

            int xmax = min(topwidth - 1, (l - max_displacement - s2o + round_off_s1) / stride1 - round_off);
            int ymax = min(topheight - 1, (m + round_off_s1) / stride1 - round_off);

            if (xmax >= xmin && ymax >= ymin) {

                float bot0tmp = bottom0[idxBotO * bottomchannels + n];
                float bot1tmp = bottom1[idxBotO * bottomchannels + n];
                float sign = (bot0tmp >= bot1tmp) ? float(-1.0) : float(1.0);
                
                int op = (o - x_shift); // index [o,p]
                int idxOpOffset = (item * topchannels + op);

                for (int y = ymin; y <= ymax; y++) {
                    int idxtopdiffBase = (idxOpOffset * topheight + y) * topwidth;
                    for (int x = xmin; x <= xmax; x++) {
                        int idxtopdiff = idxtopdiffBase + x; // topdiff[x,y,o,p]
                        sum += topdiff[idxtopdiff] * sign;
                    }
                }
            }
        }
        
        const int sumelems = (kernel_radius * 2 + 1) * (kernel_radius * 2 + 1) * bottomchannels;
        bottom1diff[index + item * bottomcount] = sum / (float)sumelems;
    }
}