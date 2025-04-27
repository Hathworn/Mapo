#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CorrelateData(const int nthreads, int num, int topwidth, int topheight, int topchannels, int topcount, int max_displacement, int neighborhood_grid_radius, int neighborhood_grid_width, int kernel_radius, int kernel_size, int stride1, int stride2, int bottomwidth, int bottomheight, int bottomchannels, const float *bottom0, const float *bottom1, float *top)
{
    extern __shared__ float patch_data[];

    // First (upper left) position of kernel upper-left corner in current center position of neighborhood in image 1
    int x1 = blockIdx.x * stride1 + max_displacement;
    int y1 = blockIdx.y * stride1 + max_displacement;
    int item = blockIdx.z;
    int ch_off = threadIdx.x;

    // Load 3D patch into shared memory
    for (int j = 0; j < kernel_size; j++) { // HEIGHT
        for (int i = 0; i < kernel_size; i++) { // WIDTH
            int ji_off = ((j * kernel_size) + i) * bottomchannels;
            for (int ch = ch_off; ch < bottomchannels; ch += blockDim.x) { // CHANNELS
                int idx1 = ((item * bottomheight + y1+j) * bottomwidth + x1+i) * bottomchannels + ch;
                int idxPatchData = ji_off + ch;
                patch_data[idxPatchData] = bottom0[idx1];
            }
        }
    }

    __syncthreads();

    float sum = 0.0f; // Use register memory for sum

    // Compute correlation
    for (int top_channel = 0; top_channel < topchannels; top_channel++) {
        int s2o = (top_channel % neighborhood_grid_width - neighborhood_grid_radius) * stride2;
        int s2p = (top_channel / neighborhood_grid_width - neighborhood_grid_radius) * stride2;

        for (int j = 0; j < kernel_size; j++) { // HEIGHT
            for (int i = 0; i < kernel_size; i++) { // WIDTH
                int ji_off = ((j * kernel_size) + i) * bottomchannels;
                for (int ch = ch_off; ch < bottomchannels; ch += blockDim.x) { // CHANNELS
                    int x2 = x1 + s2o;
                    int y2 = y1 + s2p;

                    int idxPatchData = ji_off + ch;
                    int idx2 = ((item * bottomheight + y2+j) * bottomwidth + x2+i) * bottomchannels + ch;

                    sum += patch_data[idxPatchData] * bottom1[idx2];
                }
            }
        }

        __syncthreads();

        // Use atomicAdd to ensure sum aggregation
        if (ch_off == 0) {
            const int sumelems = kernel_size * kernel_size * bottomchannels;
            const int index = ((top_channel * topheight + blockIdx.y) * topwidth) + blockIdx.x;
            atomicAdd(&top[index + item * topcount], sum / (float)sumelems);
        }
    }
}