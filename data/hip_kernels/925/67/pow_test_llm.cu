#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 pow_double2(double2 a, int b) {
    // Use more numerically stable calculations
    double r = hypot(a.x, a.y);
    double theta = atan2(a.y, a.x);
    double rb = pow(r, b);
    double btheta = b * theta;
    return {rb * cos(btheta), rb * sin(btheta)};
}

__global__ void pow_test(double2* a, int b, double2* c) {
    // Perform computation with improved pow function
    c[0] = pow_double2(a[0], b);
}