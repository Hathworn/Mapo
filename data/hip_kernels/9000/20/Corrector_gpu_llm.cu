#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Corrector_gpu(double GTIME, double *local_time, double *step, int *next, unsigned long nextsize, double4 *pos_CH, double4 *vel_CH, double4 *a_tot_D, double4 *a1_tot_D, double4 *a2_tot_D, double4 *a_H0, double4 *a3_H, double ETA6, double ETA4, double DTMAX, double DTMIN, unsigned int N) {

    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (gtid >= nextsize) return; // Boundary check
    
    // Load indices based on next and gtid
    int who = next[gtid];
    int who1 = gtid + nextsize;
    int who2 = who1 + nextsize;

    // Pre-calculate based on the above
    double h = GTIME - local_time[who];
    local_time[who] = GTIME;
    double h1 = 0.5 * h;
    double h2 = h1 * h1;
    double h3 = 0.75 / (h1 * h1 * h1);
    double h4 = 1.5 / (h2 * h2);
    double h5 = 7.5 / (h2 * h2 * h1);
    double over = 1.0 / 15.0;

    // Precomputing squares for future calculations
    for (int i = 0; i < 3; ++i) {
        int offset = i * nextsize;
        a_H0[gtid + offset].w = a_H0[gtid + offset].x * a_H0[gtid + offset].x +
                                a_H0[gtid + offset].y * a_H0[gtid + offset].y +
                                a_H0[gtid + offset].z * a_H0[gtid + offset].z;
    }

    double *A_H0_w = &a_H0[gtid].w;
    
    // Function to calculate each dimension
    auto CalculateDimension = [&] (double &pos, double &vel, int index, double &a3, double &a4half, double &a5half) {

	// Pre-calculation of values
        double Amin = a_H0[gtid].x - a_tot_D[who].x;
        double Aplu = a_H0[gtid].x + a_tot_D[who].x;
        double Jmin = h1 * (a_H0[who1].x - a1_tot_D[who].x);
        double Jplu = h1 * (a_H0[who1].x + a1_tot_D[who].x);
        double Smin = h2 * (a_H0[who2].x - a2_tot_D[who].x);
        double Splu = h2 * (a_H0[who2].x + a2_tot_D[who].x);
        
        // Corrector calculations
        pos = pos + h1 * vel - 0.4 * h2 * Amin + over * h2 * Jplu;
        vel = vel + h1 * Aplu - 0.4 * h1 * Jmin + over * h1 * Splu;
        pos += h1 * vel;
        
        // Higher order calculations for corrector step
        a3 = h3 * (-5.0 * Amin + 5.0 * Jplu - Smin);
        a4half = h4 * (-Jmin + Splu);
        a5half = h5 * (3.0 * Amin - 3.0 * Jplu + Smin);
        
        // Summation of higher-order terms
        a3 += h1 * a4half + 0.5 * h2 * a5half;
        a4half += h1 * a5half;
    };

    double a4halfx, a4halfy, a4halfz;
    double a5halfx, a5halfy, a5halfz;

    // Calculate for each of x, y, z dimensions
    CalculateDimension(pos_CH[who].x, vel_CH[who].x, 0, a3_H[who].x, a4halfx, a5halfx);
    CalculateDimension(pos_CH[who].y, vel_CH[who].y, 1, a3_H[who].y, a4halfy, a5halfy);
    CalculateDimension(pos_CH[who].z, vel_CH[who].z, 2, a3_H[who].z, a4halfz, a5halfz);

    // Final calculations
    a3_H[who].w = sqrt(a3_H[who].x * a3_H[who].x + a3_H[who].y * a3_H[who].y + a3_H[who].z * a3_H[who].z);
    double a4mod = sqrt(a4halfx * a4halfx + a4halfy * a4halfy + a4halfz * a4halfz);
    double a5mod = sqrt(a5halfx * a5halfx + a5halfy * a5halfy + a5halfz * a5halfz);

    // Timesteps with pre-calculated values
    double dt6 = (sqrt(A_H0_w[0] * A_H0_w[who2]) + A_H0_w[who1]) / (a5mod * a3_H[who].w + a4mod * a4mod);
    dt6 = ETA6 * pow(dt6, 1.0 / 6.0);

    double stp = h;
    double overh3 = 1.0 / (stp * stp * stp);
    double overh2 = 1.0 / (stp * stp);

    // Calculate a2 and a3 derivatives
    auto CalculateAccDerivative = [&] (double compTot, double comp1Tot, double &a2, double &a3) {
        a2 = overh2 * (-6.0 * (compTot - a_H0[gtid].x) - stp * (4.0 * a_H0[who1].x + 2.0 * comp1Tot));
        a3 = overh3 * (12.0 * (compTot - a_H0[gtid].x) + 6.0 * stp * (a_H0[who1].x + comp1Tot));
        a2 += h * a3;
    };

    double a2dx, a2dy, a2dz;
    double a3dx, a3dy, a3dz;

    CalculateAccDerivative(a_tot_D[who].x, a1_tot_D[who].x, a2dx, a3dx);
    CalculateAccDerivative(a_tot_D[who].y, a1_tot_D[who].y, a2dy, a3dy);
    CalculateAccDerivative(a_tot_D[who].z, a1_tot_D[who].z, a2dz, a3dz);

    double a2mod_w = a2dx * a2dx + a2dy * a2dy + a2dz * a2dz;
    a_H0[who2].w = a2mod_w;
    a3_H[who].w = a3dx * a3dx + a3dy * a3dy + a3dz * a3dz;

    double dt4 = sqrt(ETA4 * (sqrt(A_H0_w[0] * a2mod_w) + A_H0_w[who1]) / (sqrt(A_H0_w[who1] * a3_H[who].w) + a2mod_w));

    // Calculate final time step value
    double dt = 0.5 * dt4 + 0.5 * dt6;

    double rest = GTIME / (2.0 * step[who]);
    rest = (double)((int)(rest)) - rest;
    
    // Step-size update logic
    if (dt > 2.0 * step[who] && rest == 0.0 && 2.0 * step[who] <= DTMAX)
        step[who] *= 2.0;
    else if (dt < 0.5 * step[who])
        step[who] *= 0.25;
    else if (dt < step[who])
        step[who] *= 0.5;

    // Ensuring minimum step size
    if (step[who] < DTMIN)
        step[who] = DTMIN;

    // Update acceleration vectors
    a_tot_D[who] = a_H0[gtid];
    a1_tot_D[who] = a_H0[who1];
    a2_tot_D[who] = a_H0[who2];
}