#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normal_eqs_disparity_multicam_GPU(float *d_CD, float *d_disparity_compact, float4 *d_Zbuffer_normals_compact, int *d_ind_disparity_Zbuffer, const float *d_focal_length, const float *d_nodal_point_x, const float *d_nodal_point_y, const float *d_baseline, const int *d_n_cols, const int *d_n_values_disparity, const int *d_start_ind_disparity, const int *d_pixel_ind_offset) {
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

    // Initialize accumulators
    float A[27] = {0.0f};

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x;
         in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {

        if (in_ind < n_disparity) {
            // Fetch disparity, Zbuffer and normal from global memory
            float disp = d_disparity_compact[in_ind + start_ind];
            float4 tmp = d_Zbuffer_normals_compact[in_ind + start_ind];
            float Zbuffer = tmp.x;
            float nx = tmp.y;
            float ny = tmp.z;
            float nz = tmp.w;

            // Compute coordinates
            int pixel_ind = d_ind_disparity_Zbuffer[in_ind + start_ind] - pixel_ind_offset;

            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;

            x = __fdividef((x - ox), f);
            y = -__fdividef((y - oy), f);

            // Reconstruct 3D point from disparity
            float Zd = -(f * b) / disp;
            float Xd = x * Zd;
            float Yd = y * Zd;

            // Reconstruct 3D point from model
            float Zm = Zbuffer;
            float Xm = x * Zm;
            float Ym = y * Zm;

            // Evaluate constraints and update unique values in A-matrix
            A[0] += nx * nx;
            A[1] += nx * ny;
            A[2] += nx * nz;
            A[3] += Ym * nx * nz - Zm * nx * ny;
            A[4] += Zm * (nx * nx) - Xm * nx * nz;
            A[5] += -Ym * (nx * nx) + Xm * nx * ny;

            A[6] += ny * ny;
            A[7] += ny * nz;
            A[8] += -Zm * (ny * ny) + Ym * ny * nz;
            A[9] += -Xm * ny * nz + Zm * nx * ny;
            A[10] += Xm * (ny * ny) - Ym * nx * ny;

            A[11] += nz * nz;
            A[12] += Ym * (nz * nz) - Zm * ny * nz;
            A[13] += -Xm * (nz * nz) + Zm * nx * nz;
            A[14] += Xm * ny * nz - Ym * nx * nz;

            A[15] += (Ym * Ym) * (nz * nz) + (Zm * Zm) * (ny * ny) - Ym * Zm * ny * nz * 2.0f;
            A[16] += -Xm * Ym * (nz * nz) - (Zm * Zm) * nx * ny + Xm * Zm * ny * nz + Ym * Zm * nx * nz;
            A[17] += -Xm * Zm * (ny * ny) - (Ym * Ym) * nx * nz + Xm * Ym * ny * nz + Ym * Zm * nx * ny;

            A[18] += (Xm * Xm) * (nz * nz) + (Zm * Zm) * (nx * nx) - Xm * Zm * nx * nz * 2.0f;
            A[19] += -Ym * Zm * (nx * nx) - (Xm * Xm) * ny * nz + Xm * Ym * nx * nz + Xm * Zm * nx * ny;

            A[20] += (Xm * Xm) * (ny * ny) + (Ym * Ym) * (nx * nx) - Xm * Ym * nx * ny * 2.0f;

            // Update B-vector
            A[21] += Xd * (nx * nx) - Xm * (nx * nx) + Yd * nx * ny - Ym * nx * ny + Zd * nx * nz - Zm * nx * nz;
            A[22] += Yd * (ny * ny) - Ym * (ny * ny) + Xd * nx * ny - Xm * nx * ny + Zd * ny * nz - Zm * ny * nz;
            A[23] += Zd * (nz * nz) - Zm * (nz * nz) + Xd * nx * nz - Xm * nx * nz + Yd * ny * nz - Ym * ny * nz;
            A[24] += -Yd * Zm * (ny * ny) + Ym * Zd * (nz * nz) + Ym * Zm * (ny * ny) - Ym * Zm * (nz * nz) - (Ym * Ym) * ny * nz + (Zm * Zm) * ny * nz +
                       Xd * Ym * nx * nz - Xm * Ym * nx * nz - Xd * Zm * nx * ny + Yd * Ym * ny * nz + Xm * Zm * nx * ny - Zd * Zm * ny * nz;
            A[25] += Xd * Zm * (nx * nx) - Xm * Zd * (nz * nz) - Xm * Zm * (nx * nx) + Xm * Zm * (nz * nz) + (Xm * Xm) * nx * nz - (Zm * Zm) * nx * nz -
                       Xd * Xm * nx * nz - Xm * Yd * ny * nz + Xm * Ym * ny * nz + Yd * Zm * nx * ny - Ym * Zm * nx * ny + Zd * Zm * nx * nz;
            A[26] += -Xd * Ym * (nx * nx) + Xm * Yd * (ny * ny) + Xm * Ym * (nx * nx) - Xm * Ym * (ny * ny) - (Xm * Xm) * nx * ny + (Ym * Ym) * nx * ny +
                       Xd * Xm * nx * ny - Yd * Ym * nx * ny + Xm * Zd * ny * nz - Xm * Zm * ny * nz - Ym * Zd * nx * nz + Ym * Zm * nx * nz;
        }
    }

    // Write out accumulators
    int out_ind = 27 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;
    for (int i = 0; i < 27; ++i) {
        d_CD[out_ind + i * n_val_accum] = A[i];
    }
}