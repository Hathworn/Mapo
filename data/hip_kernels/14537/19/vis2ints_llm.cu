#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vis2ints(double scale, double2 *vis_in, int2* vis_out, int npts) {
    // Cache thread and block indices
    const int tid = threadIdx.x + blockIdx.x * blockDim.x;
    const int stride = gridDim.x * blockDim.x;
    
    for (int q = tid; q < npts; q += stride) {
        double2 inn = vis_in[q];
        
        // Scale inputs once and use registers effectively
        double scaled_x = inn.x * scale;
        double scaled_y = inn.y * scale;
        
        int main_y = __double2int_rd(scaled_y);                 // Use fast rounding
        int sub_y = __double2int_rd(GCF_GRID * (scaled_y - main_y));
        int main_x = __double2int_rd(scaled_x);
        int sub_x = __double2int_rd(GCF_GRID * (scaled_x - main_x));
        
        // Directly assign to output using calculated indices
        vis_out[q].x = main_x * GCF_GRID + sub_x;
        vis_out[q].y = main_y * GCF_GRID + sub_y;
    }
}