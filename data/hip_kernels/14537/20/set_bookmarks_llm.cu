#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_bookmarks(int2* vis_in, int npts, int blocksize, int blockgrid, int* bookmarks) {
    // Cache commonly used values
    int grid_stride = gridDim.x * blockDim.x;
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory to reduce global memory access
    __shared__ int shared_last_vis_x, shared_last_vis_y;

    for (int q = idx; q <= npts; q += grid_stride) {
        int2 this_vis = vis_in[q];

        // Use a thread to initialize shared memory for the first element
        if (q == 0) {
            shared_last_vis_x = -1;
            shared_last_vis_y = 0;
        } else {
            shared_last_vis_x = vis_in[q-1].x / GCF_GRID / blocksize;
            shared_last_vis_y = vis_in[q-1].y / GCF_GRID / blocksize;
        }
        __syncthreads(); // Make sure shared_last_vis_x and shared_last_vis_y are set

        int main_x = this_vis.x / GCF_GRID / blocksize;
        int main_y = this_vis.y / GCF_GRID / blocksize;

        if (npts == q) {
            main_x = main_y = blockgrid;
        }

        if (main_x != shared_last_vis_x || main_y != shared_last_vis_y) {
            for (int z = shared_last_vis_y * blockgrid + shared_last_vis_x + 1; 
                 z <= main_y * blockgrid + main_x; z++) {
                bookmarks[z] = q;
            }
        }
    }
}