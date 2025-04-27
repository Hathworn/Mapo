#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _calculate_wnp( const long* edge_num, const long* edge_start_idx, float* weight, long* ind, const int b, const int n, const int orig_p_num, const int p_num ) {
  int index = threadIdx.x + blockIdx.x * blockDim.x;
  if (index >= b * n * orig_p_num)
    return;

  // Pre-compute indices to reduce redundant calculations
  const int c_b = index / (n * orig_p_num);
  const int c_n = (index % (n * orig_p_num)) / orig_p_num;  // Simplified calculation
  const int c_edge_idx = index % orig_p_num;
  
  const long c_edge_num = edge_num[index];
  const int c_start_idx = int(edge_start_idx[index]);
  
  // Pointer calculations outside the loop to improve performance
  float* c_weight = &weight[c_b * n * p_num + c_n * p_num + c_start_idx];
  long* c_ind = &ind[c_b * n * p_num * 2 + c_n * p_num * 2 + c_start_idx * 2];

  // Using temporary variables for improved memory access patterns
  for (long i = 0; i < c_edge_num; i++) {
    float edge_ratio = float(i) / float(c_edge_num);
    c_weight[i] = edge_ratio;
    
    long ind_offset = i * 2;
    c_ind[ind_offset] = long(c_edge_idx);
    c_ind[ind_offset + 1] = long((c_edge_idx + 1) % orig_p_num);
  }
}