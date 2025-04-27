#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normal_eqs_disparity_GPU(float *d_CD, const float *d_disparity_compact, const float4 *d_Zbuffer_normals_compact, const int *d_ind_disparity_Zbuffer, float fx, float fy, float ox, float oy, float b, int n_cols, const int *d_n_values_disparity, const int *d_start_ind_disparity, float w_disp) {
    int n_val_accum = gridDim.x * blockDim.x;
    int n_disparity = d_n_values_disparity[blockIdx.y];
    int n_accum = (int)ceilf((float)n_disparity / (float)n_val_accum);
    int start_ind = d_start_ind_disparity[blockIdx.y];

    // initialize accumulators
    float accumulators[27] = {0.0f};

    for (int in_ind = blockDim.x * blockIdx.x * n_accum + threadIdx.x;
         in_ind < blockDim.x * (blockIdx.x + 1) * n_accum; in_ind += blockDim.x) {

        if (in_ind < n_disparity) {
            // fetch disparity, Zbuffer and normal from global memory
            float disp = d_disparity_compact[in_ind + start_ind];
            float4 tmp = d_Zbuffer_normals_compact[in_ind + start_ind];
            float Zbuffer = tmp.x;
            float nx = tmp.y;
            float ny = tmp.z;
            float nz = tmp.w;

            // compute coordinates
            int pixel_ind = d_ind_disparity_Zbuffer[in_ind + start_ind];
            float y = floorf(__fdividef((float)pixel_ind, n_cols));
            float x = (float)pixel_ind - y * n_cols;
            x = __fdividef((x - ox), fx);
            y = __fdividef((y - oy), fy);

            // reconstruct 3D point from disparity
            float Zd = -(fx * b) / disp;
            float Xd = x * Zd;
            float Yd = y * Zd;

            // reconstruct 3D point from model
            float Zm = Zbuffer;
            float Xm = x * Zm;
            float Ym = y * Zm;

            // weight the constraint conversion
            float w2 = fx * b / (Zm * Zm);
            w2 *= w2;

            // evaluate constraints
            accumulators[0] += w2 * (nx * nx);
            accumulators[1] += w2 * (nx * ny);
            accumulators[2] += w2 * (nx * nz);
            accumulators[3] += w2 * (Ym * nx * nz - Zm * nx * ny);
            accumulators[4] += w2 * (Zm * (nx * nx) - Xm * nx * nz);
            accumulators[5] += w2 * (-Ym * (nx * nx) + Xm * nx * ny);

            accumulators[6] += w2 * (ny * ny);
            accumulators[7] += w2 * (ny * nz);
            accumulators[8] += w2 * (-Zm * (ny * ny) + Ym * ny * nz);
            accumulators[9] += w2 * (-Xm * ny * nz + Zm * nx * ny);
            accumulators[10] += w2 * (Xm * (ny * ny) - Ym * nx * ny);

            accumulators[11] += w2 * (nz * nz);
            accumulators[12] += w2 * (Ym * (nz * nz) - Zm * ny * nz);
            accumulators[13] += w2 * (-Xm * (nz * nz) + Zm * nx * nz);
            accumulators[14] += w2 * (Xm * ny * nz - Ym * nx * nz);

            accumulators[15] += w2 * ((Ym * Ym) * (nz * nz) + (Zm * Zm) * (ny * ny) -
                                      Ym * Zm * ny * nz * 2.0f);
            accumulators[16] += w2 * (-Xm * Ym * (nz * nz) - (Zm * Zm) * nx * ny +
                                      Xm * Zm * ny * nz + Ym * Zm * nx * nz);
            accumulators[17] += w2 * (-Xm * Zm * (ny * ny) - (Ym * Ym) * nx * nz +
                                      Xm * Ym * ny * nz + Ym * Zm * nx * ny);

            accumulators[18] += w2 * ((Xm * Xm) * (nz * nz) + (Zm * Zm) * (nx * nx) -
                                      Xm * Zm * nx * nz * 2.0f);
            accumulators[19] += w2 * (-Ym * Zm * (nx * nx) - (Xm * Xm) * ny * nz +
                                      Xm * Ym * nx * nz + Xm * Zm * nx * ny);

            accumulators[20] += w2 * ((Xm * Xm) * (ny * ny) + (Ym * Ym) * (nx * nx) -
                                      Xm * Ym * nx * ny * 2.0f);

            // B-vector
            accumulators[21] += w2 * (Xd * (nx * nx) - Xm * (nx * nx) + Yd * nx * ny -
                                      Ym * nx * ny + Zd * nx * nz - Zm * nx * nz);
            accumulators[22] += w2 * (Yd * (ny * ny) - Ym * (ny * ny) + Xd * nx * ny -
                                      Xm * nx * ny + Zd * ny * nz - Zm * ny * nz);
            accumulators[23] += w2 * (Zd * (nz * nz) - Zm * (nz * nz) + Xd * nx * nz -
                                      Xm * nx * nz + Yd * ny * nz - Ym * ny * nz);
            accumulators[24] += w2 *
                                (-Yd * Zm * (ny * ny) + Ym * Zd * (nz * nz) + Ym * Zm * (ny * ny) -
                                 Ym * Zm * (nz * nz) - (Ym * Ym) * ny * nz + (Zm * Zm) * ny * nz +
                                 Xd * Ym * nx * nz - Xm * Ym * nx * nz - Xd * Zm * nx * ny +
                                 Yd * Ym * ny * nz + Xm * Zm * nx * ny - Zd * Zm * ny * nz);
            accumulators[25] += w2 *
                                (Xd * Zm * (nx * nx) - Xm * Zd * (nz * nz) - Xm * Zm * (nx * nx) +
                                 Xm * Zm * (nz * nz) + (Xm * Xm) * nx * nz - (Zm * Zm) * nx * nz -
                                 Xd * Xm * nx * nz - Xm * Yd * ny * nz + Xm * Ym * ny * nz +
                                 Yd * Zm * nx * ny - Ym * Zm * nx * ny + Zd * Zm * nx * nz);
            accumulators[26] += w2 *
                                (-Xd * Ym * (nx * nx) + Xm * Yd * (ny * ny) + Xm * Ym * (nx * nx) -
                                 Xm * Ym * (ny * ny) - (Xm * Xm) * nx * ny + (Ym * Ym) * nx * ny +
                                 Xd * Xm * nx * ny - Yd * Ym * nx * ny + Xm * Zd * ny * nz -
                                 Xm * Zm * ny * nz - Ym * Zd * nx * nz + Ym * Zm * nx * nz);
        }
    }

    // write out accumulators
    int out_ind = 27 * n_val_accum * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;
    w_disp *= w_disp;

    for (int i = 0; i < 27; ++i) {
        d_CD[out_ind + i * n_val_accum] = w_disp * accumulators[i];
    }
}