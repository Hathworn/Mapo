#include "hip/hip_runtime.h"
#include "includes.h"

//#define ITEM_COUNT 2
#define _PI 3.14159265358979323846
#define _PI2 1.57079632679489661923
#define _RAD 6372795

using namespace std;

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void geo_invert(double2* d_dot1, double2* d_dot2, double* d_dist, double* d_azimut, long count)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (idx < count)
    {
        // Pre-compute radians conversion for dot1
        double lat1_radians = d_dot1[idx].x * _PI / 180;
        double lng1_radians = d_dot1[idx].y * _PI / 180;

        // Pre-compute radians conversion for dot2
        double lat2_radians = d_dot2[idx].x * _PI / 180;
        double lng2_radians = d_dot2[idx].y * _PI / 180;

        // Use pre-computed radians for trigonometric calculations
        double cl1 = cos(lat1_radians);
        double cl2 = cos(lat2_radians);
        double sl1 = sin(lat1_radians);
        double sl2 = sin(lat2_radians);
        double delta = lng2_radians - lng1_radians;
        double cdelta = cos(delta);
        double sdelta = sin(delta);

        // Calculate distance
        double y = sqrt(pow(cl2 * sdelta, 2) + pow(cl1 * sl2 - sl1 * cl2 * cdelta, 2));
        double x = sl1 * sl2 + cl1 * cl2 * cdelta;
        double ad = atan2(y, x); // Use atan2 for better precision in angle calculation
        d_dist[idx] = ad * _RAD;

        // Calculate azimuth
        x = (cl1 * sl2) - (sl1 * cl2 * cdelta);
        y = sdelta * cl2;

        double z;
        if (x == 0)
        {
            z = (y > 0) ? -90 : (y < 0) ? 90 : 0;
        }
        else
        {
            z = atan2(-y, x) * 180 / _PI; // Use atan2 for better handling of edge cases
            if (x < 0)
            {
                z += 180;
            }
        }

        double z2 = fmod(z + 180.0, 360.0) - 180.0; // Use fmod for angle wrapping

        z2 = -z2 * _PI / 180;
        double anglerad2 = fmod(z2, 2 * _PI); // Use fmod for wrapping
        d_azimut[idx] = anglerad2 * 180 / _PI;
    }
}