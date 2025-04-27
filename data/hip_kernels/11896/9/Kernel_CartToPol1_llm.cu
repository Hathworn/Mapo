#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void Kernel_CartToPol1(double *tb1, double *tb2, int width, int height)
{
    // Calculate global thread coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (x >= width || y >= height) return;

    // Pre-compute reused values
    int x_center = width / 2;
    int y_center = height / 2;
    double dx = (double)(x - x_center);
    double dy = (double)(y - y_center);

    // Compute polar coordinates
    double R = 2 * sqrt(dx * dx + dy * dy);
    double theta = (atan2(dy, dx) + PI) * height / (2 * PI);

    // Calculate indices ensuring they are within bounds
    int x1 = (int)R % width;
    int y1 = (int)theta % height;
    int xp1 = (x1 + 1) % width;
    int yp1 = (y1 + 1) % height;

    // Retrieve matrix values
    double z1 = tb1[width * y1 + x1];
    double z2 = tb1[width * yp1 + x1];
    double z3 = tb1[width * yp1 + xp1];
    double z4 = tb1[width * y1 + xp1];

    // Interpolation weights
    double dx_interp = theta - floor(theta);
    double dy_interp = R - floor(R);

    // Bi-linear interpolation
    double zp = z1 + dy_interp * (z2 - z1);
    double zq = z4 + dy_interp * (z3 - z4);
    double ZR = zp + dx_interp * (zq - zp);

    // Store the result
    tb2[width * y + x] = ZR;
}