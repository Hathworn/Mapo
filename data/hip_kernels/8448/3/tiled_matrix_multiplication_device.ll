; ModuleID = '../data/hip_kernels/8448/3/main.cu'
source_filename = "../data/hip_kernels/8448/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ27tiled_matrix_multiplicationPiS_S_E2As = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16
@_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z27tiled_matrix_multiplicationPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = shl nsw i32 %4, 4
  %9 = add nsw i32 %8, %6
  %10 = shl i32 %5, 10
  %11 = shl nuw nsw i32 %7, 6
  %12 = add i32 %10, %11
  %13 = add i32 %12, %6
  %14 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 %6
  %15 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 %7, i32 %6
  %16 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 0
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %19, i32 addrspace(3)* %14, align 4, !tbaa !5
  %20 = shl nuw nsw i32 %7, 6
  %21 = add nsw i32 %20, %9
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %24, i32 addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %25 = load i32, i32 addrspace(3)* %16, align 16, !tbaa !5
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 0, i32 %6
  %27 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %28 = add i32 %25, %27
  %29 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 1
  %30 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %31 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 1, i32 %6
  %32 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %33 = add i32 %30, %28
  %34 = add i32 %33, %32
  %35 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 2
  %36 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %37 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 2, i32 %6
  %38 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %39 = add i32 %36, %34
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 3
  %42 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %43 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 3, i32 %6
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %45 = add i32 %42, %40
  %46 = add i32 %45, %44
  %47 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 4
  %48 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %49 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 4, i32 %6
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %51 = add i32 %48, %46
  %52 = add i32 %51, %50
  %53 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 5
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %55 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 5, i32 %6
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %57 = add i32 %54, %52
  %58 = add i32 %57, %56
  %59 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 6
  %60 = load i32, i32 addrspace(3)* %59, align 8, !tbaa !5
  %61 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 6, i32 %6
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %63 = add i32 %60, %58
  %64 = add i32 %63, %62
  %65 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 7
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %67 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 7, i32 %6
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = add i32 %66, %64
  %70 = add i32 %69, %68
  %71 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 8
  %72 = load i32, i32 addrspace(3)* %71, align 16, !tbaa !5
  %73 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 8, i32 %6
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %75 = add i32 %72, %70
  %76 = add i32 %75, %74
  %77 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 9
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %79 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 9, i32 %6
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %81 = add i32 %78, %76
  %82 = add i32 %81, %80
  %83 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 10
  %84 = load i32, i32 addrspace(3)* %83, align 8, !tbaa !5
  %85 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 10, i32 %6
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %87 = add i32 %84, %82
  %88 = add i32 %87, %86
  %89 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 11
  %90 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !5
  %91 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 11, i32 %6
  %92 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !5
  %93 = add i32 %90, %88
  %94 = add i32 %93, %92
  %95 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 12
  %96 = load i32, i32 addrspace(3)* %95, align 16, !tbaa !5
  %97 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 12, i32 %6
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %99 = add i32 %96, %94
  %100 = add i32 %99, %98
  %101 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 13
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %103 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 13, i32 %6
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !5
  %105 = add i32 %102, %100
  %106 = add i32 %105, %104
  %107 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 14
  %108 = load i32, i32 addrspace(3)* %107, align 8, !tbaa !5
  %109 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 14, i32 %6
  %110 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !5
  %111 = add i32 %108, %106
  %112 = add i32 %111, %110
  %113 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2As, i32 0, i32 %7, i32 15
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %115 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ27tiled_matrix_multiplicationPiS_S_E2Bs, i32 0, i32 15, i32 %6
  %116 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !5
  %117 = add i32 %114, %112
  %118 = add i32 %117, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %119 = add i32 %13, 16
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %122, i32 addrspace(3)* %14, align 4, !tbaa !5
  %123 = shl nuw nsw i32 %7, 6
  %124 = add nuw nsw i32 %123, 1024
  %125 = add nsw i32 %124, %9
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %126
  %128 = load i32, i32 addrspace(1)* %127, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %128, i32 addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = load i32, i32 addrspace(3)* %16, align 16, !tbaa !5
  %130 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %131 = add i32 %129, %118
  %132 = add i32 %131, %130
  %133 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %134 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %135 = add i32 %133, %132
  %136 = add i32 %135, %134
  %137 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %138 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %139 = add i32 %137, %136
  %140 = add i32 %139, %138
  %141 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %142 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %143 = add i32 %141, %140
  %144 = add i32 %143, %142
  %145 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %146 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %147 = add i32 %145, %144
  %148 = add i32 %147, %146
  %149 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %150 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %151 = add i32 %149, %148
  %152 = add i32 %151, %150
  %153 = load i32, i32 addrspace(3)* %59, align 8, !tbaa !5
  %154 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %155 = add i32 %153, %152
  %156 = add i32 %155, %154
  %157 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %158 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %159 = add i32 %157, %156
  %160 = add i32 %159, %158
  %161 = load i32, i32 addrspace(3)* %71, align 16, !tbaa !5
  %162 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %163 = add i32 %161, %160
  %164 = add i32 %163, %162
  %165 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %166 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %167 = add i32 %165, %164
  %168 = add i32 %167, %166
  %169 = load i32, i32 addrspace(3)* %83, align 8, !tbaa !5
  %170 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %171 = add i32 %169, %168
  %172 = add i32 %171, %170
  %173 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !5
  %174 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !5
  %175 = add i32 %173, %172
  %176 = add i32 %175, %174
  %177 = load i32, i32 addrspace(3)* %95, align 16, !tbaa !5
  %178 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %179 = add i32 %177, %176
  %180 = add i32 %179, %178
  %181 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %182 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !5
  %183 = add i32 %181, %180
  %184 = add i32 %183, %182
  %185 = load i32, i32 addrspace(3)* %107, align 8, !tbaa !5
  %186 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !5
  %187 = add i32 %185, %184
  %188 = add i32 %187, %186
  %189 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %190 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !5
  %191 = add i32 %189, %188
  %192 = add i32 %191, %190
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %193 = add i32 %13, 32
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %194
  %196 = load i32, i32 addrspace(1)* %195, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %196, i32 addrspace(3)* %14, align 4, !tbaa !5
  %197 = shl nuw nsw i32 %7, 6
  %198 = add nuw nsw i32 %197, 2048
  %199 = add nsw i32 %198, %9
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %200
  %202 = load i32, i32 addrspace(1)* %201, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %202, i32 addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %203 = load i32, i32 addrspace(3)* %16, align 16, !tbaa !5
  %204 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %205 = add i32 %203, %192
  %206 = add i32 %205, %204
  %207 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %208 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %209 = add i32 %207, %206
  %210 = add i32 %209, %208
  %211 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %212 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %213 = add i32 %211, %210
  %214 = add i32 %213, %212
  %215 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %216 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %217 = add i32 %215, %214
  %218 = add i32 %217, %216
  %219 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %220 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %221 = add i32 %219, %218
  %222 = add i32 %221, %220
  %223 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %224 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %225 = add i32 %223, %222
  %226 = add i32 %225, %224
  %227 = load i32, i32 addrspace(3)* %59, align 8, !tbaa !5
  %228 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %229 = add i32 %227, %226
  %230 = add i32 %229, %228
  %231 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %232 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %233 = add i32 %231, %230
  %234 = add i32 %233, %232
  %235 = load i32, i32 addrspace(3)* %71, align 16, !tbaa !5
  %236 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %237 = add i32 %235, %234
  %238 = add i32 %237, %236
  %239 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %240 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %241 = add i32 %239, %238
  %242 = add i32 %241, %240
  %243 = load i32, i32 addrspace(3)* %83, align 8, !tbaa !5
  %244 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %245 = add i32 %243, %242
  %246 = add i32 %245, %244
  %247 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !5
  %248 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !5
  %249 = add i32 %247, %246
  %250 = add i32 %249, %248
  %251 = load i32, i32 addrspace(3)* %95, align 16, !tbaa !5
  %252 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %253 = add i32 %251, %250
  %254 = add i32 %253, %252
  %255 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %256 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !5
  %257 = add i32 %255, %254
  %258 = add i32 %257, %256
  %259 = load i32, i32 addrspace(3)* %107, align 8, !tbaa !5
  %260 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !5
  %261 = add i32 %259, %258
  %262 = add i32 %261, %260
  %263 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %264 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !5
  %265 = add i32 %263, %262
  %266 = add i32 %265, %264
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %267 = add i32 %13, 48
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %268
  %270 = load i32, i32 addrspace(1)* %269, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %270, i32 addrspace(3)* %14, align 4, !tbaa !5
  %271 = shl nuw nsw i32 %7, 6
  %272 = add nuw nsw i32 %271, 3072
  %273 = add nsw i32 %272, %9
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %274
  %276 = load i32, i32 addrspace(1)* %275, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %276, i32 addrspace(3)* %15, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %277 = load i32, i32 addrspace(3)* %16, align 16, !tbaa !5
  %278 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %279 = add i32 %277, %266
  %280 = add i32 %279, %278
  %281 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %282 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %283 = add i32 %281, %280
  %284 = add i32 %283, %282
  %285 = load i32, i32 addrspace(3)* %35, align 8, !tbaa !5
  %286 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %287 = add i32 %285, %284
  %288 = add i32 %287, %286
  %289 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %290 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %291 = add i32 %289, %288
  %292 = add i32 %291, %290
  %293 = load i32, i32 addrspace(3)* %47, align 16, !tbaa !5
  %294 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %295 = add i32 %293, %292
  %296 = add i32 %295, %294
  %297 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %298 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %299 = add i32 %297, %296
  %300 = add i32 %299, %298
  %301 = load i32, i32 addrspace(3)* %59, align 8, !tbaa !5
  %302 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %303 = add i32 %301, %300
  %304 = add i32 %303, %302
  %305 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %306 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %307 = add i32 %305, %304
  %308 = add i32 %307, %306
  %309 = load i32, i32 addrspace(3)* %71, align 16, !tbaa !5
  %310 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %311 = add i32 %309, %308
  %312 = add i32 %311, %310
  %313 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %314 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %315 = add i32 %313, %312
  %316 = add i32 %315, %314
  %317 = load i32, i32 addrspace(3)* %83, align 8, !tbaa !5
  %318 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %319 = add i32 %317, %316
  %320 = add i32 %319, %318
  %321 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !5
  %322 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !5
  %323 = add i32 %321, %320
  %324 = add i32 %323, %322
  %325 = load i32, i32 addrspace(3)* %95, align 16, !tbaa !5
  %326 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !5
  %327 = add i32 %325, %324
  %328 = add i32 %327, %326
  %329 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !5
  %330 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !5
  %331 = add i32 %329, %328
  %332 = add i32 %331, %330
  %333 = load i32, i32 addrspace(3)* %107, align 8, !tbaa !5
  %334 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !5
  %335 = add i32 %333, %332
  %336 = add i32 %335, %334
  %337 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !5
  %338 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !5
  %339 = add i32 %337, %336
  %340 = add i32 %339, %338
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %341 = add nsw i32 %12, %9
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %342
  store i32 %340, i32 addrspace(1)* %343, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
