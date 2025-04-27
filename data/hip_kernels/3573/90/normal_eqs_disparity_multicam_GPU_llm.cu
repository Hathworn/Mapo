#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normal_eqs_disparity_multicam_GPU( float *d_CD, float *d_disparity_compact, float4 *d_Zbuffer_normals_compact, int *d_ind_disparity_Zbuffer, const float *d_focal_length, const float *d_nodal_point_x, const float *d_nodal_point_y, const float *d_baseline, const int *d_n_cols, const int *d_n_values_disparity, const int *d_start_ind_disparity, const int *d_pixel_ind_offset) {
    int n_val_accum = gridDim.x * blockDim.x;

    int n_disparity = d_n_values_disparity[blockIdx.y];
    int n_accum = (int)ceilf((float)n_disparity / (float)n_val_accum);
    int start_ind = d_start_ind_disparity[blockIdx.y];

    float f = d_focal_length[blockIdx.y];
    float ox = d_nodal_point_x[blockIdx.y];
    float oy = d_nodal_point_y[blockIdx.y];
    float b = d_baseline[blockIdx.y];
    int n_cols = d_n_cols[blockIdx.y];
    int pixel_ind_offset = d_pixel_ind_offset[blockIdx.y];

    __shared__ float smem_CD[27];
    if (threadIdx.x < 27) smem_CD[threadIdx.x] = 0.0f;
    __syncthreads();

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x;
         in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {
        if (in_ind < n_disparity) {
            float disp = d_disparity_compact[in_ind + start_ind];
            float4 tmp = d_Zbuffer_normals_compact[in_ind + start_ind];
            float Zbuffer = tmp.x;
            float nx = tmp.y;
            float ny = tmp.z;
            float nz = tmp.w;

            int pixel_ind = d_ind_disparity_Zbuffer[in_ind + start_ind] - pixel_ind_offset;

            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;

            x = __fdividef((x - ox), f);
            y = -__fdividef((y - oy), f);

            float Zd = -(f * b) / disp;
            float Xd = x * Zd;
            float Yd = y * Zd;

            float Zm = Zbuffer;
            float Xm = x * Zm;
            float Ym = y * Zm;

            atomicAdd(&smem_CD[0], nx * nx);
            atomicAdd(&smem_CD[1], nx * ny);
            atomicAdd(&smem_CD[2], nx * nz);
            atomicAdd(&smem_CD[3], Ym * nx * nz - Zm * nx * ny);
            atomicAdd(&smem_CD[4], Zm * (nx * nx) - Xm * nx * nz);
            atomicAdd(&smem_CD[5], -Ym * (nx * nx) + Xm * nx * ny);
            atomicAdd(&smem_CD[6], ny * ny);
            atomicAdd(&smem_CD[7], ny * nz);
            atomicAdd(&smem_CD[8], -Zm * (ny * ny) + Ym * ny * nz);
            atomicAdd(&smem_CD[9], -Xm * ny * nz + Zm * nx * ny);
            atomicAdd(&smem_CD[10], Xm * (ny * ny) - Ym * nx * ny);
            atomicAdd(&smem_CD[11], nz * nz);
            atomicAdd(&smem_CD[12], Ym * (nz * nz) - Zm * ny * nz);
            atomicAdd(&smem_CD[13], -Xm * (nz * nz) + Zm * nx * nz);
            atomicAdd(&smem_CD[14], Xm * ny * nz - Ym * nx * nz);
            atomicAdd(&smem_CD[15], (Ym * Ym) * (nz * nz) + (Zm * Zm) * (ny * ny) -
                     Ym * Zm * ny * nz * 2.0f);
            atomicAdd(&smem_CD[16], -Xm * Ym * (nz * nz) - (Zm * Zm) * nx * ny + Xm * Zm * ny * nz +
                     Ym * Zm * nx * nz);
            atomicAdd(&smem_CD[17], -Xm * Zm * (ny * ny) - (Ym * Ym) * nx * nz + Xm * Ym * ny * nz +
                     Ym * Zm * nx * ny);
            atomicAdd(&smem_CD[18], (Xm * Xm) * (nz * nz) + (Zm * Zm) * (nx * nx) -
                     Xm * Zm * nx * nz * 2.0f);
            atomicAdd(&smem_CD[19], -Ym * Zm * (nx * nx) - (Xm * Xm) * ny * nz + Xm * Ym * nx * nz +
                     Xm * Zm * nx * ny);
            atomicAdd(&smem_CD[20], (Xm * Xm) * (ny * ny) + (Ym * Ym) * (nx * nx) -
                     Xm * Ym * nx * ny * 2.0f);
            atomicAdd(&smem_CD[21], Xd * (nx * nx) - Xm * (nx * nx) + Yd * nx * ny - Ym * nx * ny +
                     Zd * nx * nz - Zm * nx * nz);
            atomicAdd(&smem_CD[22], Yd * (ny * ny) - Ym * (ny * ny) + Xd * nx * ny - Xm * nx * ny +
                     Zd * ny * nz - Zm * ny * nz);
            atomicAdd(&smem_CD[23], Zd * (nz * nz) - Zm * (nz * nz) + Xd * nx * nz - Xm * nx * nz +
                     Yd * ny * nz - Ym * ny * nz);
            atomicAdd(&smem_CD[24], -Yd * Zm * (ny * ny) + Ym * Zd * (nz * nz) + Ym * Zm * (ny * ny) -
                     Ym * Zm * (nz * nz) - (Ym * Ym) * ny * nz + (Zm * Zm) * ny * nz +
                     Xd * Ym * nx * nz - Xm * Ym * nx * nz - Xd * Zm * nx * ny +
                     Yd * Ym * ny * nz + Xm * Zm * nx * ny - Zd * Zm * ny * nz);
            atomicAdd(&smem_CD[25], Xd * Zm * (nx * nx) - Xm * Zd * (nz * nz) - Xm * Zm * (nx * nx) +
                     Xm * Zm * (nz * nz) + (Xm * Xm) * nx * nz - (Zm * Zm) * nx * nz -
                     Xd * Xm * nx * nz - Xm * Yd * ny * nz + Xm * Ym * ny * nz +
                     Yd * Zm * nx * ny - Ym * Zm * nx * ny + Zd * Zm * nx * nz);
            atomicAdd(&smem_CD[26], -Xd * Ym * (nx * nx) + Xm * Yd * (ny * ny) + Xm * Ym * (nx * nx) -
                     Xm * Ym * (ny * ny) - (Xm * Xm) * nx * ny + (Ym * Ym) * nx * ny +
                     Xd * Xm * nx * ny - Yd * Ym * nx * ny + Xm * Zd * ny * nz -
                     Xm * Zm * ny * nz - Ym * Zd * nx * nz + Ym * Zm * nx * nz);
        }
    }
    __syncthreads();

    int out_ind = 27 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;

    if (threadIdx.x < 27) d_CD[out_ind] = smem_CD[threadIdx.x];
}