; ModuleID = '../data/hip_kernels/2107/4/main.cu'
source_filename = "../data/hip_kernels/2107/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z32SolveSmoothGaussianGlobalKernel3PfS_S_S_iiiS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture writeonly %7, float addrspace(1)* nocapture writeonly %8, float addrspace(1)* nocapture writeonly %9, float addrspace(1)* nocapture writeonly %10) local_unnamed_addr #0 {
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %13, %18
  %20 = add i32 %19, %12
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !5, !invariant.load !6
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = add i32 %27, %21
  %29 = mul nsw i32 %28, %6
  %30 = add nsw i32 %29, %20
  %31 = icmp slt i32 %20, %4
  %32 = icmp slt i32 %28, %5
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %34, label %226

34:                                               ; preds = %11
  %35 = add nsw i32 %28, -1
  %36 = icmp slt i32 %28, 1
  %37 = mul nsw i32 %35, %6
  %38 = add nsw i32 %37, -1
  %39 = icmp slt i32 %20, 1
  %40 = select i1 %39, i1 true, i1 %36
  br i1 %40, label %52, label %41

41:                                               ; preds = %34
  %42 = add i32 %38, %20
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = fmul contract float %45, 0.000000e+00
  %47 = fadd contract float %46, 0.000000e+00
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %43
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = fmul contract float %49, 0.000000e+00
  %51 = fadd contract float %50, 0.000000e+00
  br label %52

52:                                               ; preds = %41, %34
  %53 = phi float [ %51, %41 ], [ 0.000000e+00, %34 ]
  %54 = phi float [ %47, %41 ], [ 0.000000e+00, %34 ]
  %55 = icmp slt i32 %20, 0
  %56 = icmp sge i32 %20, %4
  %57 = select i1 %55, i1 true, i1 %56
  %58 = select i1 %57, i1 true, i1 %36
  br i1 %58, label %70, label %59

59:                                               ; preds = %52
  %60 = add i32 %37, %20
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  %64 = fmul contract float %63, 0x3FC5566D00000000
  %65 = fadd contract float %54, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract float %67, 0x3FC5566D00000000
  %69 = fadd contract float %53, %68
  br label %70

70:                                               ; preds = %59, %52
  %71 = phi float [ %69, %59 ], [ %53, %52 ]
  %72 = phi float [ %65, %59 ], [ %54, %52 ]
  %73 = add nsw i32 %20, 2
  %74 = icmp slt i32 %20, -1
  %75 = icmp sgt i32 %73, %4
  %76 = select i1 %74, i1 true, i1 %75
  %77 = select i1 %76, i1 true, i1 %36
  br i1 %77, label %89, label %78

78:                                               ; preds = %70
  %79 = add i32 %38, %73
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !6
  %83 = fmul contract float %82, 0.000000e+00
  %84 = fadd contract float %72, %83
  %85 = getelementptr inbounds float, float addrspace(1)* %1, i64 %80
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !7, !amdgpu.noclobber !6
  %87 = fmul contract float %86, 0.000000e+00
  %88 = fadd contract float %71, %87
  br label %89

89:                                               ; preds = %78, %70
  %90 = phi float [ %88, %78 ], [ %71, %70 ]
  %91 = phi float [ %84, %78 ], [ %72, %70 ]
  %92 = icmp slt i32 %28, 0
  %93 = icmp sge i32 %28, %5
  %94 = add nsw i32 %29, -1
  br i1 %39, label %110, label %95

95:                                               ; preds = %89
  %96 = icmp sgt i32 %20, %4
  %97 = select i1 %96, i1 true, i1 %92
  %98 = select i1 %97, i1 true, i1 %93
  br i1 %98, label %110, label %99

99:                                               ; preds = %95
  %100 = add i32 %94, %20
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %0, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !7, !amdgpu.noclobber !6
  %104 = fmul contract float %103, 0x3FC5566D00000000
  %105 = fadd contract float %91, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %101
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = fmul contract float %107, 0x3FC5566D00000000
  %109 = fadd contract float %90, %108
  br label %110

110:                                              ; preds = %99, %95, %89
  %111 = phi float [ %109, %99 ], [ %90, %95 ], [ %90, %89 ]
  %112 = phi float [ %105, %99 ], [ %91, %95 ], [ %91, %89 ]
  br i1 %55, label %128, label %113

113:                                              ; preds = %110
  %114 = icmp sge i32 %20, %4
  %115 = select i1 %114, i1 true, i1 %92
  %116 = select i1 %115, i1 true, i1 %93
  br i1 %116, label %128, label %117

117:                                              ; preds = %113
  %118 = add i32 %29, %20
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !7, !amdgpu.noclobber !6
  %122 = fmul contract float %121, 0x3FD554C980000000
  %123 = fadd contract float %112, %122
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %119
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !7, !amdgpu.noclobber !6
  %126 = fmul contract float %125, 0x3FD554C980000000
  %127 = fadd contract float %111, %126
  br label %128

128:                                              ; preds = %117, %113, %110
  %129 = phi float [ %127, %117 ], [ %111, %113 ], [ %111, %110 ]
  %130 = phi float [ %123, %117 ], [ %112, %113 ], [ %112, %110 ]
  br i1 %74, label %146, label %131

131:                                              ; preds = %128
  %132 = icmp sgt i32 %73, %4
  %133 = select i1 %132, i1 true, i1 %92
  %134 = select i1 %133, i1 true, i1 %93
  br i1 %134, label %146, label %135

135:                                              ; preds = %131
  %136 = add i32 %94, %73
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !7, !amdgpu.noclobber !6
  %140 = fmul contract float %139, 0x3FC5566D00000000
  %141 = fadd contract float %130, %140
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %137
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !7, !amdgpu.noclobber !6
  %144 = fmul contract float %143, 0x3FC5566D00000000
  %145 = fadd contract float %129, %144
  br label %146

146:                                              ; preds = %135, %131, %128
  %147 = phi float [ %145, %135 ], [ %129, %131 ], [ %129, %128 ]
  %148 = phi float [ %141, %135 ], [ %130, %131 ], [ %130, %128 ]
  %149 = add nsw i32 %28, 2
  %150 = add nsw i32 %28, 1
  %151 = icmp slt i32 %28, -1
  %152 = icmp sgt i32 %149, %5
  %153 = mul nsw i32 %150, %6
  %154 = add nsw i32 %153, -1
  br i1 %39, label %170, label %155

155:                                              ; preds = %146
  %156 = icmp sgt i32 %20, %4
  %157 = select i1 %156, i1 true, i1 %151
  %158 = select i1 %157, i1 true, i1 %152
  br i1 %158, label %170, label %159

159:                                              ; preds = %155
  %160 = add i32 %154, %20
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7, !amdgpu.noclobber !6
  %164 = fmul contract float %163, 0.000000e+00
  %165 = fadd contract float %148, %164
  %166 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !6
  %168 = fmul contract float %167, 0.000000e+00
  %169 = fadd contract float %147, %168
  br label %170

170:                                              ; preds = %159, %155, %146
  %171 = phi float [ %169, %159 ], [ %147, %155 ], [ %147, %146 ]
  %172 = phi float [ %165, %159 ], [ %148, %155 ], [ %148, %146 ]
  br i1 %55, label %188, label %173

173:                                              ; preds = %170
  %174 = icmp sge i32 %20, %4
  %175 = select i1 %174, i1 true, i1 %151
  %176 = select i1 %175, i1 true, i1 %152
  br i1 %176, label %188, label %177

177:                                              ; preds = %173
  %178 = add i32 %153, %20
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %0, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7, !amdgpu.noclobber !6
  %182 = fmul contract float %181, 0x3FC5566D00000000
  %183 = fadd contract float %172, %182
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7, !amdgpu.noclobber !6
  %186 = fmul contract float %185, 0x3FC5566D00000000
  %187 = fadd contract float %171, %186
  br label %188

188:                                              ; preds = %177, %173, %170
  %189 = phi float [ %187, %177 ], [ %171, %173 ], [ %171, %170 ]
  %190 = phi float [ %183, %177 ], [ %172, %173 ], [ %172, %170 ]
  br i1 %74, label %206, label %191

191:                                              ; preds = %188
  %192 = icmp sgt i32 %73, %4
  %193 = select i1 %192, i1 true, i1 %151
  %194 = select i1 %193, i1 true, i1 %152
  br i1 %194, label %206, label %195

195:                                              ; preds = %191
  %196 = add i32 %154, %73
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %0, i64 %197
  %199 = load float, float addrspace(1)* %198, align 4, !tbaa !7, !amdgpu.noclobber !6
  %200 = fmul contract float %199, 0.000000e+00
  %201 = fadd contract float %190, %200
  %202 = getelementptr inbounds float, float addrspace(1)* %1, i64 %197
  %203 = load float, float addrspace(1)* %202, align 4, !tbaa !7, !amdgpu.noclobber !6
  %204 = fmul contract float %203, 0.000000e+00
  %205 = fadd contract float %189, %204
  br label %206

206:                                              ; preds = %195, %191, %188
  %207 = phi float [ %205, %195 ], [ %189, %191 ], [ %189, %188 ]
  %208 = phi float [ %201, %195 ], [ %190, %191 ], [ %190, %188 ]
  %209 = sext i32 %30 to i64
  %210 = getelementptr inbounds float, float addrspace(1)* %7, i64 %209
  store float %208, float addrspace(1)* %210, align 4, !tbaa !7
  %211 = getelementptr inbounds float, float addrspace(1)* %8, i64 %209
  store float %207, float addrspace(1)* %211, align 4, !tbaa !7
  %212 = getelementptr inbounds float, float addrspace(1)* %2, i64 %209
  %213 = load float, float addrspace(1)* %212, align 4, !tbaa !7
  %214 = getelementptr inbounds float, float addrspace(1)* %0, i64 %209
  %215 = load float, float addrspace(1)* %214, align 4, !tbaa !7
  %216 = fadd contract float %213, %215
  %217 = fsub contract float %216, %208
  %218 = getelementptr inbounds float, float addrspace(1)* %9, i64 %209
  store float %217, float addrspace(1)* %218, align 4, !tbaa !7
  %219 = getelementptr inbounds float, float addrspace(1)* %3, i64 %209
  %220 = load float, float addrspace(1)* %219, align 4, !tbaa !7
  %221 = getelementptr inbounds float, float addrspace(1)* %1, i64 %209
  %222 = load float, float addrspace(1)* %221, align 4, !tbaa !7
  %223 = fadd contract float %220, %222
  %224 = fsub contract float %223, %207
  %225 = getelementptr inbounds float, float addrspace(1)* %10, i64 %209
  store float %224, float addrspace(1)* %225, align 4, !tbaa !7
  br label %226

226:                                              ; preds = %11, %206
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
