#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_extract_roi(float* __restrict__ input, float* __restrict__ output, const char* __restrict__ mean, const int input_w, const int output_w, const int output_h, const int in_plane_r, const int in_plane_g, const int in_plane_b, const int out_plane_r, const int out_plane_g, const int out_plane_b, const int bbox_x, const int bbox_y, const int bbox_w, const int bbox_h)
{
    // Calculate output indices
    uint x = blockIdx.x * blockDim.x + threadIdx.x;
    uint y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within bounds
    if (x < output_w && y < output_h)
    {
        // Precompute reused calculations
        float r_x = float(x) * bbox_w / output_w + bbox_x;
        float r_y = float(y) * bbox_h / output_h + bbox_y;

        float u = r_x - floor(r_x);
        float v = r_y - floor(r_y);

        int floor_rx = int(floor(r_x));
        int floor_ry = int(floor(r_y));
        int ceil_rx = int(ceil(r_x));
        int ceil_ry = int(ceil(r_y));

        // Combine pos array calculation
        int pos[4][2] = { {floor_rx, floor_ry}, {ceil_rx, floor_ry}, {floor_rx, ceil_ry}, {ceil_rx, ceil_ry} };

        // Combine map calculation
        int map[4] = { pos[0][1] * input_w + pos[0][0], pos[1][1] * input_w + pos[1][0],
                       pos[2][1] * input_w + pos[2][0], pos[3][1] * input_w + pos[3][0] };

        // Precompute weight calculations
        float s[4] = { (1-u)*(1-v), u*(1-v), (1-u)*v, u*v };

        int idx = y * output_w + x;
        // Use loop unrolling for output computation
        #pragma unroll
        for (int i = 0; i < 3; ++i) {
            int in_plane = (i == 0 ? in_plane_r : (i == 1 ? in_plane_g : in_plane_b));
            int out_plane = (i == 0 ? out_plane_r : (i == 1 ? out_plane_g : out_plane_b));
            output[idx + out_plane] = round(s[0] * input[map[0] + in_plane]
                                          + s[1] * input[map[1] + in_plane]
                                          + s[2] * input[map[2] + in_plane]
                                          + s[3] * input[map[3] + in_plane]);
        }
    }
}