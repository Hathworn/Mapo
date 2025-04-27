#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

__global__ void KGaborFilter1(double* filter, double* Vr, int width, int height, double ss, double r0, double sr0, double stheta0)
{
    // Calculate global thread indices and check bounds
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= width || j >= height) return;

    // Determine x and y positions relative to the center
    double x = (i > width / 2) ? width - i : i;
    double y = (j > height / 2) ? height - j : j;

    // Compute radius with offset to prevent division by zero
    const double Eps = 1E-6;
    double r = sqrt(x * x + y * y) + Eps;

    // Compute angle
    double theta = (x > 0) ? atan2(y, x) : PI / 2;

    // Calculate filter value
    double ff = exp(cos(2 * theta) / (4 * pow(stheta0, 2))) *
                exp(-0.5 * pow(log(r / r0), 2) / log(1 + pow(sr0, 2))) *
                pow(r0 / r, 3) * 4 * pow(ss * r, 3);

    // Assign the calculated value to filter and Vr arrays
    filter[i + j * width] = ff;
    Vr[i + j * width] = (i > 0 || j > 0) ? ff / (4 * pow(ss * r, 3)) : 0;
}