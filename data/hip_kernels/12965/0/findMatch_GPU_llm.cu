#include "hip/hip_runtime.h"
#include "includes.h"

__device__ uint32_t getAddressOffsetGrid_GPU (const int32_t& x,const int32_t& y,const int32_t& d,const int32_t& width,const int32_t& disp_num) {
return (y*width+x)*disp_num+d;
}

__device__ uint32_t getAddressOffsetImage_GPU (const int32_t& u,const int32_t& v,const int32_t& width) {
return v*width+u;
}

__global__ void findMatch_GPU (int32_t* u_vals, int32_t* v_vals, int32_t size_total, float* planes_a, float* planes_b, float* planes_c, int32_t* disparity_grid, int32_t *grid_dims, uint8_t* I1_desc, uint8_t* I2_desc, int32_t* P, int32_t plane_radius, int32_t width ,int32_t height, bool* valids, bool right_image, float* D) {
    const int32_t disp_num    = grid_dims[0]-1;
    const int32_t window_size = 2;

    // TODO: Remove hard code and use param
    bool subsampling = false;
    bool match_texture = true;
    int32_t grid_size = 20;

    // Pixel id
    uint32_t idx = blockDim.x*blockIdx.x + threadIdx.x;

    // Check that we are in range
    if(idx >= size_total)
        return;

    // Load values from memory
    uint32_t u = u_vals[idx];
    uint32_t v = v_vals[idx];
    float plane_a = planes_a[idx];
    float plane_b = planes_b[idx];
    float plane_c = planes_c[idx];
    bool valid = valids[idx];

    uint32_t d_addr = subsampling ? getAddressOffsetImage_GPU(u/2,v/2,width/2) : getAddressOffsetImage_GPU(u,v,width);

    if (u < window_size || u >= width - window_size)
        return;

    // Precompute constants
    int32_t line_offset = 16 * width * max(min(v, height - 3), 2);
    uint8_t* I1_line_addr = (right_image ? I2_desc : I1_desc) + line_offset;
    uint8_t* I2_line_addr = (right_image ? I1_desc : I2_desc) + line_offset;

    // Compute I1 block start address
    uint8_t* I1_block_addr = I1_line_addr + 16 * u;

    // Texture Check
    int32_t sum = 0;
    for (int32_t i = 0; i < 16; i++)
        sum += abs((int32_t)(*(I1_block_addr + i)) - 128);
    if (sum < match_texture)
        return;

    int32_t d_plane = (int32_t)(plane_a * (float)u + plane_b * (float)v + plane_c);
    int32_t d_plane_min = max(d_plane - plane_radius, 0);
    int32_t d_plane_max = min(d_plane + plane_radius, disp_num - 1);

    int32_t grid_x = (int32_t)floor((float)u / (float)grid_size);
    int32_t grid_y = (int32_t)floor((float)v / (float)grid_size);
    uint32_t grid_addr = getAddressOffsetGrid_GPU(grid_x, grid_y, 0, grid_dims[1], grid_dims[0]);
    int32_t num_grid = *(disparity_grid + grid_addr);
    int32_t* d_grid = disparity_grid + grid_addr + 1;

    // Initialize minimum values
    int32_t min_val = 10000;
    int32_t min_d = -1;

    // Process disparities
    for (int32_t i = 0; i < num_grid; i++) {
        int32_t d_curr = d_grid[i];
        if (d_curr < d_plane_min || d_curr > d_plane_max) {
            int32_t u_warp = u - d_curr + 2 * right_image * d_curr;
            if (u_warp < window_size || u_warp >= width - window_size)
                continue;
            u_warp = 16 * u_warp;
            int32_t val = 0;
            for(int j=0; j<16; j++) {
                val = __sad((int)(*(I1_block_addr+j)), (int)(*(I2_line_addr+j+u_warp)), val);
            }
            if (val < min_val) {
                min_val = val;
                min_d = d_curr;
            }
        }
    }

    // Disparity inside the grid
    for (int32_t d_curr = d_plane_min; d_curr <= d_plane_max; d_curr++) {
        int32_t u_warp = u - d_curr + 2 * right_image * d_curr;
        if (u_warp < window_size || u_warp >= width - window_size)
            continue;
        u_warp = 16 * u_warp;
        int32_t val = 0;
        for(int j=0; j<16; j++) {
            val = __sad((int)(*(I1_block_addr+j)), (int)(*(I2_line_addr+j+u_warp)), val);
        }
        val += valid ? *(P + abs(d_curr - d_plane)) : 0;
        if (val < min_val) {
            min_val = val;
            min_d = d_curr;
        }
    }

    // Output disparity
    if (min_d >= 0) *(D + d_addr) = min_d;
    else *(D + d_addr) = -1;
}