#include "hip/hip_runtime.h"
#include "includes.h"

#define ROUND_OFF 50000

#define CUDA_NUM_THREADS 1024
#define WARPS_PER_BLOCK 1
#define THREADS_PER_WARP 32

#define CUDA_KERNEL_LOOP(i, n) for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (n); i += blockDim.x * gridDim.x)

#define GET_BLOCKS(n, t) (n+t-1) / t

// == Dimension rearrangement Kernel

__global__ void CorrelateDataSubtract_1d(const int nthreads, int num, int item, int topwidth, int topheight, int topchannels, int topcount, int max_displacement, int x_shift, int neighborhood_grid_width, int kernel_radius, int stride1, int stride2, int bottomwidth, int bottomheight, int bottomchannels, const float *bottom0, const float *bottom1, float *top)
{
    CUDA_KERNEL_LOOP(index, nthreads) {
        int x = index % topwidth; // w-pos
        int y = (index / topwidth) % topheight; // h-pos
        int c = (index / topwidth / topheight) % topchannels; // channels
        
        // Pre-calculate shared indices 
        int x1 = x * stride1 + kernel_radius + max_displacement;
        int y1 = y * stride1 + kernel_radius;
        int s2o = (c % neighborhood_grid_width + x_shift) * stride2;
        int x2 = x1 + s2o;

        float sum = 0.0f; // Use float precision directly
        const int sumelems = (kernel_radius * 2 + 1) * (kernel_radius * 2 + 1) * bottomchannels;
        
        // Iterate efficiently over 3D patch
        #pragma unroll // Unroll the innermost loop for better performance
        for(int l = 0; l < bottomchannels; l++) { // CHANNELS
            for(int j = -kernel_radius; j <= kernel_radius; j++) { // HEIGHT
                for(int i = -kernel_radius; i <= kernel_radius; i++) { // WIDTH
                    // Calculate indices for bottom data access
                    int idx1 = ((item * bottomheight + y1 + j) * bottomwidth + x1 + i) * bottomchannels + l;
                    int idx2 = ((item * bottomheight + y1 + j) * bottomwidth + x2 + i) * bottomchannels + l;
                    
                    // Perform correlation and accumulate result
                    sum += fabsf(bottom0[idx1] - bottom1[idx2]);
                }
            }
        }
        // Store result in the output
        top[index + item * topcount] = sum / (float)sumelems;
    }
}