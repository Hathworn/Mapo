#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 complex_multiply(double2 z1, double2 z2)
{
    double real = z1.x * z2.x - z1.y * z2.y;
    double imag = z1.y * z2.x + z1.x * z2.y;
    return make_double2(real, imag);
}

__global__ void inverse_dft_with_w_correction(double2 *grid, size_t grid_pitch, const double3 *visibilities, const double2 *vis_intensity, int vis_count, int batch_count, int x_offset, int y_offset, int render_size, double cell_size)
{
    // Compute global thread indices
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if out of bounds
    if (idx >= render_size || idy >= render_size) return;

    double real_sum = 0.0;
    double imag_sum = 0.0;

    // Calculate x and y image coordinates
    double x = (idx + x_offset) * cell_size;
    double y = (idy + y_offset) * cell_size;

    double2 theta_complex;
    double image_correction = sqrt(1.0 - (x * x) - (y * y));
    double w_correction = image_correction - 1.0;

    // Loop through all visibilities
    for (int i = 0; i < batch_count; ++i)
    {
        double theta = 2.0 * M_PI * (x * visibilities[i].x + y * visibilities[i].y + (w_correction * visibilities[i].z));
        double sin_theta, cos_theta;
        sincos(theta, &sin_theta, &cos_theta);
        theta_complex = make_double2(cos_theta, sin_theta);

        double2 vis = complex_multiply(vis_intensity[i], theta_complex);
        real_sum += vis.x;
        imag_sum += vis.y;
    }

    // Apply image correction
    real_sum *= image_correction;
    imag_sum *= image_correction;

    // Write result to grid and normalize by vis_count
    double2 *row = (double2*)((char*)grid + idy * grid_pitch);
    row[idx].x += (real_sum / vis_count);
    row[idx].y += (imag_sum / vis_count);
}