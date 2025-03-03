; ModuleID = '../data/hip_kernels/8919/6/main.cu'
source_filename = "../data/hip_kernels/8919/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ14matrixMulCUDA5PfS_S_jE3A_S = internal unnamed_addr addrspace(3) global [4096 x float] undef, align 16
@_ZZ14matrixMulCUDA5PfS_S_jE3B_S = internal unnamed_addr addrspace(3) global [4096 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14matrixMulCUDA5PfS_S_j(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %21 = add i32 %19, %20
  %22 = icmp eq i32 %3, 0
  %23 = mul i32 %13, %3
  br i1 %22, label %49, label %24

24:                                               ; preds = %4
  %25 = and i32 %3, 7
  %26 = icmp ult i32 %3, 8
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = and i32 %3, -8
  br label %55

29:                                               ; preds = %55, %24
  %30 = phi i32 [ 0, %24 ], [ %153, %55 ]
  %31 = icmp eq i32 %25, 0
  br i1 %31, label %49, label %32

32:                                               ; preds = %29, %32
  %33 = phi i32 [ %46, %32 ], [ %30, %29 ]
  %34 = phi i32 [ %47, %32 ], [ 0, %29 ]
  %35 = add i32 %33, %23
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7
  %39 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %33
  store float %38, float addrspace(3)* %39, align 4, !tbaa !7
  %40 = mul i32 %33, %3
  %41 = add i32 %40, %21
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds float, float addrspace(1)* %2, i64 %42
  %44 = load float, float addrspace(1)* %43, align 4, !tbaa !7
  %45 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %33
  store float %44, float addrspace(3)* %45, align 4, !tbaa !7
  %46 = add nuw nsw i32 %33, 1
  %47 = add i32 %34, 1
  %48 = icmp eq i32 %47, %25
  br i1 %48, label %49, label %32, !llvm.loop !11

49:                                               ; preds = %29, %32, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %174, label %50

50:                                               ; preds = %49
  %51 = and i32 %3, 7
  %52 = icmp ult i32 %3, 8
  br i1 %52, label %156, label %53

53:                                               ; preds = %50
  %54 = and i32 %3, -8
  br label %179

55:                                               ; preds = %55, %27
  %56 = phi i32 [ 0, %27 ], [ %153, %55 ]
  %57 = phi i32 [ 0, %27 ], [ %154, %55 ]
  %58 = add i32 %56, %23
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !7
  %62 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %56
  store float %61, float addrspace(3)* %62, align 16, !tbaa !7
  %63 = mul i32 %56, %3
  %64 = add i32 %63, %21
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7
  %68 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %56
  store float %67, float addrspace(3)* %68, align 16, !tbaa !7
  %69 = or i32 %56, 1
  %70 = add i32 %69, %23
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7
  %74 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %69
  store float %73, float addrspace(3)* %74, align 4, !tbaa !7
  %75 = mul i32 %69, %3
  %76 = add i32 %75, %21
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %2, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !7
  %80 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %69
  store float %79, float addrspace(3)* %80, align 4, !tbaa !7
  %81 = or i32 %56, 2
  %82 = add i32 %81, %23
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %81
  store float %85, float addrspace(3)* %86, align 8, !tbaa !7
  %87 = mul i32 %81, %3
  %88 = add i32 %87, %21
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !7
  %92 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %81
  store float %91, float addrspace(3)* %92, align 8, !tbaa !7
  %93 = or i32 %56, 3
  %94 = add i32 %93, %23
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %1, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7
  %98 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %93
  store float %97, float addrspace(3)* %98, align 4, !tbaa !7
  %99 = mul i32 %93, %3
  %100 = add i32 %99, %21
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7
  %104 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %93
  store float %103, float addrspace(3)* %104, align 4, !tbaa !7
  %105 = or i32 %56, 4
  %106 = add i32 %105, %23
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %1, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !7
  %110 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %105
  store float %109, float addrspace(3)* %110, align 16, !tbaa !7
  %111 = mul i32 %105, %3
  %112 = add i32 %111, %21
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %2, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !7
  %116 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %105
  store float %115, float addrspace(3)* %116, align 16, !tbaa !7
  %117 = or i32 %56, 5
  %118 = add i32 %117, %23
  %119 = zext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7
  %122 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %117
  store float %121, float addrspace(3)* %122, align 4, !tbaa !7
  %123 = mul i32 %117, %3
  %124 = add i32 %123, %21
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7
  %128 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %117
  store float %127, float addrspace(3)* %128, align 4, !tbaa !7
  %129 = or i32 %56, 6
  %130 = add i32 %129, %23
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  %133 = load float, float addrspace(1)* %132, align 4, !tbaa !7
  %134 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %129
  store float %133, float addrspace(3)* %134, align 8, !tbaa !7
  %135 = mul i32 %129, %3
  %136 = add i32 %135, %21
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %2, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7
  %140 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %129
  store float %139, float addrspace(3)* %140, align 8, !tbaa !7
  %141 = or i32 %56, 7
  %142 = add i32 %141, %23
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %141
  store float %145, float addrspace(3)* %146, align 4, !tbaa !7
  %147 = mul i32 %141, %3
  %148 = add i32 %147, %21
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !7
  %152 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %141
  store float %151, float addrspace(3)* %152, align 4, !tbaa !7
  %153 = add nuw nsw i32 %56, 8
  %154 = add i32 %57, 8
  %155 = icmp eq i32 %154, %28
  br i1 %155, label %29, label %55, !llvm.loop !13

156:                                              ; preds = %179, %50
  %157 = phi float [ undef, %50 ], [ %237, %179 ]
  %158 = phi i32 [ 0, %50 ], [ %238, %179 ]
  %159 = phi float [ 0.000000e+00, %50 ], [ %237, %179 ]
  %160 = icmp eq i32 %51, 0
  br i1 %160, label %174, label %161

161:                                              ; preds = %156, %161
  %162 = phi i32 [ %171, %161 ], [ %158, %156 ]
  %163 = phi float [ %170, %161 ], [ %159, %156 ]
  %164 = phi i32 [ %172, %161 ], [ 0, %156 ]
  %165 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %162
  %166 = load float, float addrspace(3)* %165, align 4, !tbaa !7
  %167 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %162
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !7
  %169 = fmul contract float %166, %168
  %170 = fadd contract float %163, %169
  %171 = add nuw nsw i32 %162, 1
  %172 = add i32 %164, 1
  %173 = icmp eq i32 %172, %51
  br i1 %173, label %174, label %161, !llvm.loop !15

174:                                              ; preds = %156, %161, %49
  %175 = phi float [ 0.000000e+00, %49 ], [ %157, %156 ], [ %170, %161 ]
  %176 = add i32 %21, %23
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %0, i64 %177
  store float %175, float addrspace(1)* %178, align 4, !tbaa !7
  ret void

179:                                              ; preds = %179, %53
  %180 = phi i32 [ 0, %53 ], [ %238, %179 ]
  %181 = phi float [ 0.000000e+00, %53 ], [ %237, %179 ]
  %182 = phi i32 [ 0, %53 ], [ %239, %179 ]
  %183 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %180
  %184 = load float, float addrspace(3)* %183, align 16, !tbaa !7
  %185 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %180
  %186 = load float, float addrspace(3)* %185, align 16, !tbaa !7
  %187 = fmul contract float %184, %186
  %188 = fadd contract float %181, %187
  %189 = or i32 %180, 1
  %190 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %189
  %191 = load float, float addrspace(3)* %190, align 4, !tbaa !7
  %192 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %189
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !7
  %194 = fmul contract float %191, %193
  %195 = fadd contract float %188, %194
  %196 = or i32 %180, 2
  %197 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %196
  %198 = load float, float addrspace(3)* %197, align 8, !tbaa !7
  %199 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %196
  %200 = load float, float addrspace(3)* %199, align 8, !tbaa !7
  %201 = fmul contract float %198, %200
  %202 = fadd contract float %195, %201
  %203 = or i32 %180, 3
  %204 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %203
  %205 = load float, float addrspace(3)* %204, align 4, !tbaa !7
  %206 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %203
  %207 = load float, float addrspace(3)* %206, align 4, !tbaa !7
  %208 = fmul contract float %205, %207
  %209 = fadd contract float %202, %208
  %210 = or i32 %180, 4
  %211 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %210
  %212 = load float, float addrspace(3)* %211, align 16, !tbaa !7
  %213 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %210
  %214 = load float, float addrspace(3)* %213, align 16, !tbaa !7
  %215 = fmul contract float %212, %214
  %216 = fadd contract float %209, %215
  %217 = or i32 %180, 5
  %218 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %217
  %219 = load float, float addrspace(3)* %218, align 4, !tbaa !7
  %220 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %217
  %221 = load float, float addrspace(3)* %220, align 4, !tbaa !7
  %222 = fmul contract float %219, %221
  %223 = fadd contract float %216, %222
  %224 = or i32 %180, 6
  %225 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %224
  %226 = load float, float addrspace(3)* %225, align 8, !tbaa !7
  %227 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %224
  %228 = load float, float addrspace(3)* %227, align 8, !tbaa !7
  %229 = fmul contract float %226, %228
  %230 = fadd contract float %223, %229
  %231 = or i32 %180, 7
  %232 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3A_S, i32 0, i32 %231
  %233 = load float, float addrspace(3)* %232, align 4, !tbaa !7
  %234 = getelementptr inbounds [4096 x float], [4096 x float] addrspace(3)* @_ZZ14matrixMulCUDA5PfS_S_jE3B_S, i32 0, i32 %231
  %235 = load float, float addrspace(3)* %234, align 4, !tbaa !7
  %236 = fmul contract float %233, %235
  %237 = fadd contract float %230, %236
  %238 = add nuw nsw i32 %180, 8
  %239 = add i32 %182, 8
  %240 = icmp eq i32 %239, %54
  br i1 %240, label %156, label %179, !llvm.loop !16
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !14}
